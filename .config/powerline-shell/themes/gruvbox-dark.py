from powerline_shell.themes.default import DefaultColor


class Color(DefaultColor):
   
    HOME_SPECIAL_DISPLAY = True
    HOME_FG = 15
    HOME_BG = 236 
    
    PATH_FG = 0 
    PATH_BG = 214 
    SEPARATOR_FG = 0
    
    CWD_FG = 0

    # Second line
    TIME_FG = 0
    TIME_BG = 214 

    HOSTNAME_FG = 0 
    HOSTNAME_BG = 148 # 154 - green

    CMD_PASSED_FG = 15
    CMD_PASSED_BG = 236 # dark grey
    CMD_FAILED_FG = 15
    CMD_FAILED_BG = 125 # deep pink
