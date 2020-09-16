#!/usr/bin/env python3
import sys
import json
import subprocess
from hibpwned import Pwned
from colored import fg, attr, bg
from zxcvbn import zxcvbn

data = json.load(sys.stdin)
yellow = fg("yellow")
blue = fg("blue")
red = fg("red")
light_red = fg("light_red")
gray = fg("light_gray")
cyan = fg("cyan")
green = fg("green")
purple = attr("bold") + fg("blue")
reset = attr("reset")


def print_line(key, message, color="", end="\n"):
    print(f"{yellow}{key}{reset}: {color}{message}{reset}", end=end)


def get_folder_from_id(folder_id):
    if not folder_id:
        return ""
    folder = json.loads(subprocess.check_output(["bw", "get", "folder", folder_id]))
    return f"{cyan}{folder['name']}{gray}/"


def print_item_name(item):
    folder_name = get_folder_from_id(item["folderId"])
    print(f"{folder_name}{purple}{item['name']}{reset} {green}[id: {item['id']}]{reset}")


def colorize_pw(password):
    password = password if password else ""
    out = ""
    for c in password:
        color = ""
        reset = attr("reset")
        if c.isnumeric():
            color = cyan
        elif c.isalpha():
            reset = ""
        else:
            color = light_red
        out += f"{color}{c}{reset}"
    return out


def get_zxcvbn(password):
    zxcv = zxcvbn(password)
    col = {1: red, 2: red, 3: yellow, 4: green}
    out = f"(Score: {col[zxcv['score']]}{zxcv['score']}{reset})"
    fast = zxcv["crack_times_display"]["offline_fast_hashing_1e10_per_second"]
    slow = zxcv["crack_times_display"]["online_throttling_100_per_hour"]
    suggestions = "\n".join(zxcv["feedback"]["suggestions"])
    if not suggestions:
        suggestions = f"Cracked in {fast} at worst, {slow} at best."
    print_line("zxcvbn", out + f" {suggestions}")


def get_pwned_account(account, user_agent):
    pwned = Pwned(account, user_agent)
    all_breaches = pwned.searchAllBreaches()
    num_breaches = len(all_breaches) if isinstance(all_breaches, list) else 0
    str_breaches = ""
    if item["login"]["username"] and all_breaches != 404:
        if num_breaches <= 5:
            sorted_breaches = sorted(all_breaches, key=lambda b: b["BreachDate"], reverse=True)
            formatted_breaches = [f"{b['Name']} ({b['BreachDate']})" for b in sorted_breaches]
            str_breaches = f" [{', '.join(formatted_breaches)}]"
        print_line("pwned", f"{num_breaches} breaches{reset}{str_breaches}", red)
    return pwned


def get_pwned_password(pwned, password):
    if password and pwned.searchPassword(password):
        print_line("pwned", f"{pwned.searchPassword(password)} times")


def get_uris(login_uris):
    num_uris = len(login_uris)
    for c, u in enumerate(login_uris):
        count = f" {c+1}" if num_uris > 1 else ""
        print_line(f"URL{count}", f"{u['uri']}")


for item in sorted(data, key=lambda x: x["revisionDate"]):
    print_item_name(item)
    if "login" not in item:
        print(json.dumps(item, indent=2))
        continue
    username = item["login"]["username"]
    password = item["login"]["password"]
    print_line("Username", username)
    pwned = get_pwned_account(username, item["id"])
    print_line("Password", colorize_pw(password))
    get_pwned_password(pwned, password)
    get_zxcvbn(password)
    get_uris(item["login"]["uris"])
    print_line("Revision", item["revisionDate"], end="\n\n")
