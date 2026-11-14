BOUNCE BACK - Simple version (Godot 4.3+)

1. Open Godot 4 -> Import -> pick project.godot
2. Double-click main.tscn in the FileSystem panel to see the level in 2D.
   (Scroll = zoom, middle mouse button = pan)
3. Press F5 to play.

Controls: A/D or Left/Right to move, R to restart.

FILES (each one is small!)
  main.tscn   the whole level - click things in the 2D view and drag them
  player.tscn + player.gd   the player (bounces by itself)
  bee.tscn / slime.tscn + mob.gd   enemies that walk left and right
  star.tscn + star.gd   collectible star
  pad.gd      bounce pad      spike.gd   spikes      goal.gd   the flag

TRY THIS
  - Click a bee or slime in main.tscn, change "Range X", "Speed" or "Bob" in the Inspector
  - Open player.gd and change BOUNCE or SPEED at the top
  - Duplicate a Platform (Ctrl+D) and drag it somewhere new
