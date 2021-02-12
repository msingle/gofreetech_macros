-- Numpad
lmc_device_set_name('MACROS','2C91701F');
lmc.minimizeToTray = true
lmc_minimize()
-- Label   | ESC | TAB      | CALC |  ←
-- KeyCode | 27  |   9      | XXX  |  8
-- Label   | NUM |  /       |  *   |  =
-- KeyCode | XXX | 111      | 106  | 187
-- Label   |  7  |  8       |   9  |  -
-- KeyCode | 103 | 104      | 105  | 109
-- Label   |  4  |  5       |   6  |  +
-- KeyCode | 100 | 101      | 102  | 107
-- Label   |  1  |  2       |   3  |
-- KeyCode |  97 |  98      |  99  |
-- Label   |  0  | 000      |   .  | RET
-- KeyCode |  96 | 96,96,96 | 110  | 13
local NUMPAD = {
  ESC = 27;
  TAB = 9;
  BSPC = 8;
  DIV = 111;
  MUL = 106;
  EQSGN = 187;
  SEVEN = 103;
  EIGHT = 104;
  NINE = 105;
  MINUS = 109;
  FOUR = 100;
  FIVE = 101;
  SIX = 102;
  PLUS = 107;
  ONE = 97;
  TWO = 98;
  THREE = 99;
  ZERO = 96;
  DOT = 110;
  RET = 13;
};

-- Alt for number, decimals does 144,x,144

-- define callback for whole device
lmc_set_handler('MACROS',function(button, direction)
  if (direction == 1) then return end  -- ignore down
  if     (button == NUMPAD.EQSGN) then lmc_send_input(179, 0, 0)  -- media pause
  -- Start Windows Terminal as Admin
  elseif (button == NUMPAD.BSPC  ) then lmc_spawn("powershell.exe", "Start-Process -Verb RunAs wt")
--elseif (button == 109) then lmc_send_input(179, 0, 0)  -- media pause
  elseif (button == NUMPAD.MINUS) then lmc_spawn("C:\\Program Files\\VSCodium\\VSCodium.exe")
  elseif (button == string.byte('N')) then lmc_spawn("notepad", "C:\\test.txt")
  elseif (button == string.byte('H')) then lmc_send_keys('Hello world')
  else print('Not yet assigned: ' .. button) 
  end
end)    
