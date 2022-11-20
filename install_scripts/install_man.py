import os
import re
import shutil

import requests
import wget


def get_api(reponame, branch):
    api_url = f"https://api.github.com/repos/{reponame}/git/trees/{branch}?recursive=1"
    r = requests.get(api_url)
    res = r.json()
    return res


def get_raw_url(reponame, branch, man_path):
    raw_content_url = (
        f"https://raw.githubusercontent.com/{reponame}/{branch}/{man_path}"
    )
    return raw_content_url


if __name__ == "__main__":
    # author/repo and pattern
    repos = [
        ["ajeetdsouza/zoxide", "main", "^man/man1/"],
        ["junegunn/fzf", "master", "^man/man1/"],
        ["sharkdp/bat", "master", "^assets/manual/bat.1"],
        ["ogham/exa", "master", "^man/exa.1.md"],
        ["sharkdp/fd", "master", "^doc/fd.1"],
        ["jhawthorn/fzy", "master", "^fzy.1"],
        ["neovim/neovim", "master", "^src/man/nvim.1"],
        ["BurntSushi/ripgrep", "master", "^doc/rg.1.txt.tpl"],
        ["Genivia/ugrep", "master", "^man/ugrep.1"],
    ]
    out_dir = os.path.expanduser("~") + "/dotfiles/Local/.local/share/man/man1/"
    print(out_dir + "\n")
    shutil.rmtree(out_dir)

    os.makedirs(out_dir + "fzf", exist_ok=True)
    os.makedirs(out_dir + "zoxide", exist_ok=True)

    for repo in repos:
        res_json = get_api(repo[0], repo[1])
        for file in res_json["tree"]:
            file = file["path"]
            regex = re.compile(repo[2])
            if regex.match(file):
                print(get_raw_url(repo[0], repo[1], file))
                if repo[0] == "ajeetdsouza/zoxide":
                    wget.download(
                        get_raw_url(repo[0], repo[1], file), out=out_dir + "zoxide"
                    )
                elif repo[0] == "junegunn/fzf":
                    wget.download(
                        get_raw_url(repo[0], repo[1], file), out=out_dir + "fzf"
                    )
                else:
                    wget.download(get_raw_url(repo[0], repo[1], file), out=out_dir)
                print("\n")
        if repo[0] == "sharkdp/bat":
            os.rename(out_dir + "bat.1.in", out_dir + "bat.1")
        if repo[0] == "ogham/exa":
            os.rename(out_dir + "exa.1.md", out_dir + "exa.1")
        if repo[0] == "BurntSushi/ripgrep":
            os.rename(out_dir + "rg.1.txt.tpl", out_dir + "rg.1")
