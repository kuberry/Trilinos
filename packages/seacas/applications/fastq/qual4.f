C    Copyright(C) 1999-2020 National Technology & Engineering Solutions
C    of Sandia, LLC (NTESS).  Under the terms of Contract DE-NA0003525 with
C    NTESS, the U.S. Government retains certain rights in this software.
C    
C    See packages/seacas/LICENSE for details

C $Id: qual4.f,v 1.1 1990/11/30 11:14:20 gdsjaar Exp $
C $Log: qual4.f,v $
C Revision 1.1  1990/11/30 11:14:20  gdsjaar
C Initial revision
C
C
CC* FILE: [.PAVING]QUAL4.FOR
CC* MODIFIED BY: TED BLACKER
CC* MODIFICATION DATE: 7/6/90
CC* MODIFICATION: COMPLETED HEADER INFORMATION
C
      SUBROUTINE QUAL4 (MXND, MXCORN, MLN, NCORN, LCORN, LNODES, ICOMB,
     &   ANGLE, LXN, ITEST, LTEST, QUAL, POSBL4, ERR)
C***********************************************************************
C
C  SUBROTINE QUAL4 = CHECKS THE QUALITY OF A RECTANGLE INTERPRETATION
C
C***********************************************************************
C
      DIMENSION LNODES (MLN, MXND), ANGLE (MXND), LCORN (MXCORN)
      DIMENSION ICOMB (MXCORN), ITEST (4), LTEST (4), LXN (4, MXND)
C
      LOGICAL ERR, POSBL4
C
      REAL NICKS, NICKC
C
      ERR = .FALSE.
C
C  ASSUME PERFECT QUALITY
C
      QUAL = 0.
      POSBL4 = .FALSE.
C
C  FIRST GET THE INTERVAL LENGTHS TO THE CHOSEN CORNERS
C
      ILEN = 4
      CALL SPACED (MXND, MXCORN, MLN, ILEN, NCORN, LCORN, LNODES, ICOMB,
     &   ITEST, LTEST, ERR)
      IF (ERR) GOTO 110
C
C  GET SEE IF A RECTANGLE INTERPRETATION IS POSSIBLE WITH
C  THESE INTERVALS
C
      IF ( (LTEST(1) .EQ. LTEST(3)) .AND.
     &   (LTEST(2) .EQ. LTEST(4)) ) THEN
         POSBL4 = .TRUE.
      ELSE
         RETURN
      ENDIF
C
C  NOT ADD UP THE NICKS FOR BAD ANGLES
C
      DO 100 I =1, NCORN
         NODE = LCORN (I)
         IF (ICOMB (I) .EQ. 1) THEN
            QUAL = QUAL + (.8 * NICKC (ANGLE (NODE), LXN (1, NODE)) )
         ELSE
            QUAL = QUAL + (.8 * NICKS (ANGLE (NODE), LXN (1, NODE)) )
         ENDIF
  100 CONTINUE
C
  110 CONTINUE
C
      RETURN
C
      END
