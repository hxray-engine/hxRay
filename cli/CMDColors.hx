package cli;

@:enum
abstract CMDColors(String) {
    var PURPLE = '\033[95m';
    var CYAN = '\033[96m';
    var DARKCYAN = '\033[36m';
    var  BLUE = '\033[94m';
    var GREEN = '\033[92m';
    var YELLOW = '\033[93m';
    var RED = '\033[91m';
    var BOLD = '\033[1m';
    var  UNDERLINE = '\033[4m';
    var END = '\033[0m';
}