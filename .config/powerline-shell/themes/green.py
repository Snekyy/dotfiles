from powerline_shell.themes.default import DefaultColor

COLOR = {
    "black": 0,
    "white": 15,
    "grey": 236,
    "orange": 214,
    "green": 148,
    "blue": 75,
    "purple": 56,
    "red": 125,
    "pink": 132
}

class Color(DefaultColor):

    HOME_SPECIAL_DISPLAY = True
    HOME_FG = COLOR["white"]
    HOME_BG = COLOR["grey"]

    PATH_FG = COLOR["black"]
    PATH_BG = COLOR["orange"]
    SEPARATOR_FG = COLOR["black"]

    CWD_FG = COLOR["black"]

    # Second line
    TIME_FG = COLOR["black"]
    TIME_BG = COLOR["orange"]

    SSH_FG = COLOR["black"]
    SSH_BG = COLOR["pink"] 

    VIRTUAL_ENV_FG = COLOR["black"]
    VIRTUAL_ENV_BG = COLOR["green"]

    REPO_CLEAN_FG = COLOR["black"]
    REPO_CLEAN_BG = COLOR["blue"]
    REPO_DIRTY_FG = COLOR["black"] 
    REPO_DIRTY_BG = COLOR["blue"] 
    GIT_NOTSTAGED_FG = COLOR["white"] 
    GIT_NOTSTAGED_BG = COLOR["purple"]
    GIT_UNTRACKED_FG = COLOR["white"] 
    GIT_UNTRACKED_BG = COLOR["purple"]

    CMD_PASSED_FG = COLOR["white"] 
    CMD_PASSED_BG = COLOR["grey"] 
    CMD_FAILED_FG = COLOR["white"] 
    CMD_FAILED_BG = COLOR["red"]
