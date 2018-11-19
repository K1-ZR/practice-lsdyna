*KEYWORD
*TITLE
One element model test
$
$  k1zr - 18/11/18 - initial generation
$
$
$
$  use $ to comment out description
$  use $$ to comment out cards
$
$  Units: kg, m, s, N, Pa, J, 9.806
$
$###############################################################################
$$$$  Control Ouput
$###############################################################################
$
*CONTROL_TERMINATION 
$   endtim    endcyc     dtmin    endeng    endmas
        1.
$
*CONTROL_OUTPUT
$    npopt    neecho    nrefup    iaccop     opifs    ipnint    ikedit    iflush
         1         3
$
$  - npopt = 1, with suppression
$  - neecho = 3, both node and element printing is suppressed.
$
*DATABASE_BINARY_D3PLOT
$       dt       lcdt
      0.05
$
*DATABASE_EXTENT_BINARY
$    neiph     neips    maxint    strflg    sigflg    epsflg    rltflg    engflg
                                       1
$   cmpflg    ieverp    beamip     dcomp      shge     stssz    n3thdt
                   1
$  - strflg = 1, dump strain tensors for plotting (d3plot) and ascii (elout) 
$  - ieverp = 1, store each state output in its own d3plot file
$  
$ 
*DATABASE_HISTORY_NODE
$--------+---------+---------+---------+---------+---------+---------+---------+
$      id1       id2       id3       id4
         5         3
$   - nodes for nodout
$     * 5 on top of the block
$     * 3 bottom of the block
$
$$*DATABASE_RWFORC
$       dt
$$     100.0
$
$
$###############################################################################
$$$$  Define Materials and Parts
$###############################################################################
$
*PART 
aluminum block 
$--------+---------+---------+---------+---------+---------+---------+---------+
$      PID     SECID       MID     EOSID      HGID      GRAV    ADPOPT      TMID
         1         1         1 
*SECTION_SOLID 
$--------+---------+---------+---------+---------+---------+---------+---------+
$    SECID    ELFORM       AET
         1 
*MAT_ELASTIC
$--------+---------+---------+---------+---------+---------+---------+---------+ 
$      MID        RO         E        PR        DA        DB         K
         1     2700.   70.e+09        .3 
$
$###############################################################################
$$$$  Define Constraints, Boundary & Initial Conditions
$###############################################################################
$
*BOUNDARY_SPC_NODE
$--------+---------+---------+---------+---------+---------+---------+---------+
$      nid       cid      dofx      dofy      dofz     dofrx     dofry     dofrz
         1         0         1         1         1         1         1         1
         2         0         0         1         1         0         0         0
         3         0         0         0         1         0         0         0
         4         0         1         0         1         0         0         0
         5         0         1         1         0         0         0         0
         6         0         0         1         0         0         0         0
         7         0         0         0         0         0         0         0
         8         0         1         0         0         0         0         0
$
$  - 1, is fixed
$
$###############################################################################
$$$$  Define Load
$###############################################################################
$
*LOAD_SEGMENT 
$--------+---------+---------+---------+---------+---------+---------+---------+ 
$     LCID        SF        AT        N1        N2        N3        N4  
         1        1.        0.         5         6         7         8
$ 
*DEFINE_CURVE 
$--------+---------+---------+---------+---------+---------+---------+---------+ 
$     LCID      SIDR       SFA       SFO      OFFA      OFFO    DATTYP
         1        
$------------------+-------------------+
$                 A1                  O1
                  0.                  0.
                  1.             70.e+09
$
$###############################################################################
$$$$  Define Contacts - Sliding Interfaces
$###############################################################################
$
$$*CONTACT_AUTOMATIC_SINGLE_SURFACE
$     ssid      msid     sstyp     mstyp    sboxid    mboxid       spr       mpr
$$         1                   2
$
$       fs        fd        dc        vc       vdc    penchk        bt        dt
$$      0.08      0.08
$
$      sfs       sfm       sst       mst      sfst      sfmt       fsf       vsf
$$
$
$
$$*SET_PART_LIST
$     psid
$$         1
$     pid1      pid2      pid3      pid4      pid5      pid6      pid7      pid8
$$         1         2         3         4
$
$
$###############################################################################
$$$$  Define Cross Sections
$###############################################################################
$
$$$  all parts considered in sectioning the planes  (psid = 0)
$
$$  second row from bottom
$
$*DATABASE_CROSS_SECTION_PLANE
$     psid       xct       yct       zct       xch       ych       zch
$         0       0.0       0.0      10.0       0.0       0.0       0.0
$     xhev      yhev      zhev      lenl      lenm
$     100.0       0.0       0.0
$
$$  second row from top
$
$*DATABASE_CROSS_SECTION_PLANE
$     psid       xct       yct       zct       xch       ych       zch
$         0       0.0       0.0     260.0       0.0       0.0       0.0
$     xhev      yhev      zhev      lenl      lenm
$     100.0       0.0     260.0
$
$
$###############################################################################
$$$$  Define Nodes and Elements
$###############################################################################
$
*ELEMENT_SOLID 
$------+-------+-------+-------+-------+-------+-------+-------+-------+-------+
$    EID     PID      N1      N2      N3      N4      N5      N6      N7      N8
       1       1       1       2       3       4       5       6       7       8 
*NODE 
$------+---------------+---------------+---------------+-------+-------+-------+
$    NID               X               Y               Z      TC      RC
       1              0.              0.              0.          
       2              1.              0.              0.
       3              1.              1.              0. 
       4              0.              1.              0.
       5              0.              0.              1.
       6              1.              0.              1.
       7              1.              1.              1.
       8              0.              1.              1. 
$
$
*END
