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
        ["sharkdp/bat", "master", "^assets/completions/bat.(bash|zsh)"],
        ["dandavison/delta", "master", "^etc/completion/completion.(bash|zsh)"],
        ["ogham/exa", "master", "^completions/(bash|zsh)/"],
        ["junegunn/fzf", "master", "^shell/(.*)(bash|zsh)$"],
        ["ajeetdsouza/zoxide", "main", "^contrib/completions/(.*)(_zoxide|bash)$"],
        ["sharkdp/fd", "master", "^contrib/completion/_fd"],
        ["BurntSushi/ripgrep", "master", "^complete/_rg"],
    ]
    out_dir = os.path.expanduser("~") + "/dotfiles/Zsh/.zsh/completion/"
    print(out_dir + "\n")
    shutil.rmtree(out_dir)
    os.makedirs(out_dir, exist_ok=True)

    for repo in repos:
        res_json = get_api(repo[0], repo[1])
        for file in res_json["tree"]:
            file = file["path"]
            regex = re.compile(repo[2])
            if regex.match(file):
                print(file)
                print(get_raw_url(repo[0], repo[1], file))
                wget.download(get_raw_url(repo[0], repo[1], file), out=out_dir)
                print("\n")
        if repo[0] == "sharkdp/bat":
            os.rename(out_dir + "bat.bash.in", out_dir + "bat.bash")
            os.rename(out_dir + "bat.zsh.in", out_dir + "bat.zsh")
        if repo[0] == "dandavison/delta":
            os.rename(out_dir + "completion.bash", out_dir + "delta.bash")
            os.rename(out_dir + "completion.zsh", out_dir + "delta.zsh")
        if repo[0] == "ogham/exa":
            os.rename(out_dir + "exa", out_dir + "exa.bash")
        if repo[0] == "junegunn/fzf":
            os.rename(out_dir + "completion.bash", out_dir + "fzf.bash")
            os.rename(out_dir + "completion.zsh", out_dir + "fzf.zsh")
            os.rename(out_dir + "key-bindings.bash", out_dir + "fzf-keybind.bash")
            os.rename(out_dir + "key-bindings.zsh", out_dir + "fzf-keybind.zsh")

    # Move bash-completion files to correct dir
    import glob

    match = r"/home/charles/dotfiles/Zsh/.zsh/completion/*.bash"
    res = glob.glob(match)
    print(res)
    bash_cmp_dir = (
        os.path.expanduser("~")
        + "/dotfiles/Local/.local/share/bash-completion/completions/"
    )
    shutil.rmtree(bash_cmp_dir)
    os.makedirs(bash_cmp_dir, exist_ok=True)
    for file in res:
        shutil.move(
            file,
            bash_cmp_dir,
        )
