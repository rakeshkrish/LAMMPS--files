#run from linux terminal --> nohup vmd -dispdev text -e rgr_resid.tcl &
set filename rgyr1.txt
mol new system.psf type psf
set filelist {dimer.dcd}
set fid [open $filename w]
set first_frame 0	
set last_frame -1
set stride 10
foreach crnt_file $filelist {
animate read dcd $crnt_file beg 0 end -1 waitfor all
set nf [molinfo top get numframes]

set sel [atomselect top "type 2"]  
for {set frame 0} {$frame < $nf} {incr frame} {
  $sel frame $frame
  $sel update 
  set frame_write [format "%d" [expr {$frame + $first_frame}]]
  set radigyr [measure rgyr $sel]
  puts $fid "$frame_write\t$radigyr"
} 

}
close $fid 
$sel delete 
exit
