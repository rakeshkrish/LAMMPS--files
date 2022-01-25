# LAMMPS--files

Simulation data file, scriptfile and analysis script file are attached.

dimer_initial.data :
----------------------------------------------------------------------------
LAMMPS data file for the dimer system. It has two chains of 80 bead polymer with  7 beads of type 2 and rest of beads as type 1.

multimer_initial_2bead.data :
-----------------------------------------------------------------------------
LAMMPS initial data file for the homogeneous multimer system. It has 30 chains of 80 bead polymer with  7 type beads (modeled as specifically interacting) and rest of the beads as type 1 (modeled as non-specifically interacting).

multimer_initial_3bead_10per.data :
------------------------------------------------------------------------------
LAMMPS initial data file for the homogeneous multimer system. It has 30 chains of 80 bead polymer with  7 type beads (modeled as specifically interacting) and 10% of beads as type 3 beads (modeled as non-interacting/replusive) and rest of the beads as type 1 (modeled as non-specifically interacting).

multimer_hetero_initial.data:
-------------------------------------------------------------------------------
LAMMPS initial data file for the heterogeneous multimer system. It has 30 chains made up of 15 chains of 2 types each. Each chain contain central patch of 7 beads for specifically interacting beads and other beads for non-specifically/non-interacting(only repulsive) interacting.

non-specific contact.tcl/specific contact.tcl
-------------------------------------------------------------------------------
TCL script for calculating non-specific/specific contacts. This can be run in VMD (Visual Molecular Dynamics) software.

Command: vmd -dispdev text -e non_specific_contact.tcl/specific contact.tcl

Requirements psf file (can be generated from VMD ) and dcd file, output of simulation.

rgyr.tcl
-------------------------------------------------------------------------------
TCL script for calculating radius of gyration. This can be run in VMD (Visual Molecular Dynamics) software.

Command: vmd -dispdev text -e rgyr.tcl

Requirements psf file (can be generated from VMD ) and dcd file, output of simulation.

sim.in
--------------------------------------------------------------------------------
LAMMPS simulation script file. 

--The script file requires data file as input. 
  -Under data file name section, the name of data file can be modified depending on the system.

--Pair coeff section can be modified depending on the number of types of beads.
  -Three pairs of coefficients are given for two types of beads.
  -Modify the Pair_coeff section based on the data file and types of beads in data file. 

--loop variable should be modified for the number of trajectories.

--run command can be modified for simulation time.  
