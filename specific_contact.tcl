set outfile [open sp.sizeval.contact.txt w] 
#set nf [molinfo top get numframes] 
mol new system.psf type psf
#set filelist {ns_0p2.dcd}
#set fid [open $filename w]
set first_frame 0	
set last_frame  -1

#foreach crnt_file $filelist

#animate read dcd $crnt_file beg 0 end -1 waitfor all
animate read dcd dimer.sizeval.dcd beg 0 end -1 skip 10 waitfor all

package require pbctools
pbc wrap -center com -centersel "residue 0" -compound residue -all

set nf [molinfo top get numframes]

for {set i 0} {$i<$nf} {incr i} {
set x 0
set y 0     
for {set j 0} {$j < 2} {incr j} {
      for {set k 0} {$k < 2} {incr k} {
          #puts "$nf $j $k"
          set P2 [atomselect top "residue $j and type 2"]  
          set P1 [atomselect top "residue $k and type 2"]
	  $P2 frame $i 
	  $P1 frame $i 
	  $P2 update 
	  $P1 update 
        
         if {$k > $j} {
          set contact [llength [lindex [measure contacts 12.25 $P2 $P1] 0]] 
          set x [expr $x + $contact]
          set y [expr $i]
                      }
          $P2 delete 
	  $P1 delete 
          
                                      }
                                                       }
puts $outfile "$y $x" 
}
 
close $outfile 
exit
