set outfile [open ns_contact.txt w] 

mol new system.psf type psf

set first_frame 0	
set last_frame  -1

animate read dcd dimer.dcd beg 0 end -1 skip 10 waitfor all #dcd output of LAMMPS simulation

package require pbctools

pbc wrap -center com -centersel "residue 0" -compound residue -all

set nf [molinfo top get numframes]

for {set i 0} {$i<$nf} {incr i} {
set x 0
set y 0     
for {set j 0} {$j < 2} {incr j} { # change $j  <2 and $k < 2 to $j <30 and $k <30  for a multimeric system
      for {set k 0} {$k < 2} {incr k} {

          set P2 [atomselect top "residue $j and type 1"]  
          set P1 [atomselect top "residue $k"]
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
