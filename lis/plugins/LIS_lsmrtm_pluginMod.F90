!-----------------------BEGIN NOTICE -- DO NOT EDIT-----------------------
! NASA Goddard Space Flight Center Land Information System (LIS) v7.2
!
! Copyright (c) 2015 United States Government as represented by the
! Administrator of the National Aeronautics and Space Administration.
! All Rights Reserved.
!-------------------------END NOTICE -- DO NOT EDIT-----------------------
#include "LIS_misc.h"
#include "LIS_plugins.h"
module LIS_lsmrtm_pluginMod
!BOP
!
! !MODULE: LIS_lsmrtm_pluginMod
! 
! !DESCRIPTION: 
!   
! !REVISION HISTORY: 
!  24 Mar 09    Sujay Kumar  Initial Specification
!  15 Sep 10    Yudong Tian; Reistered for CRTM2 
!  20 Oct 10    Yudong Tian; Reistered for CRTM2 EMonly
!  08 Feb 11    Yudong Tian; Reistered for CMEM3 
! 
!EOP  
  implicit none
  PRIVATE
!------------------------------------------------------------------------------
! !PUBLIC MEMBER FUNCTIONS:
!------------------------------------------------------------------------------
  PUBLIC :: LIS_lsmrtm_plugin  
  
contains
!BOP
! !ROUTINE: LIS_lsmtm_plugin
!  \label{LIS_lsmtm_plugin}
!
! !DESCRIPTION:
!
!  
! !INTERFACE:
subroutine LIS_lsmrtm_plugin
!EOP
#if ( defined RTMS )
   use LIS_pluginIndices

#if ( defined SM_CATCHMENT )
#if ( defined RM_RTM_FORWARD )
!   external cat_f2t
#endif
#if ( defined RTMS_CRTM )
!   external cat_sfc2crtm
#endif
#if ( defined RTMS_CMEM )
!   external cat_sfc2cmem3
#endif
#endif

#if ( defined SM_NOAH_3_3 )
#if ( defined RM_RTM_FORWARD )
   external noah33_f2t
#endif
#if ( defined RTMS_CRTM ) || ( defined RTMS_CRTM2 ) || ( defined RTMS_CRTM2EM )
   external noah33_sfc2crtm
#endif
#if ( defined RTMS_CMEM )
   external noah33_sfc2cmem3
#endif
#if ( defined RTMS_TAU_OMEGA )
   external noah33_sfc2tauomega
#endif
#endif

#if ( defined SM_MOSAIC )
#if ( defined RM_RTM_FORWARD )
   external mos_f2t
#endif
#if ( defined RTMS_CMEM )
   external mos_sfc2cmem3
#endif
#endif

#if ( defined SM_CATCHMENT )
#if ( defined RM_RTM_FORWARD )
!   call registerlsm2rtm(trim(LIS_crtmId)//"+"//&
!                        trim(LIS_catchId)//char(0), cat_sfc2crtm)
#endif
#if ( defined RTMS_CRTM2 )
!    call registerlsm2rtm(trim(LIS_crtm2Id)//"+"//&
!         trim(LIS_catchId)//char(0), cat_sfc2crtm)
#endif
#if ( defined RTMS_CRTM2EM )
!    call registerlsm2rtm(trim(LIS_crtm2EMId)//"+"//&
!         trim(LIS_catchId)//char(0), cat_sfc2crtm)
#endif
#if ( defined RTMS_CMEM )
!    call registerlsm2rtm(trim(LIS_cmem3Id)//"+"//&
!         trim(LIS_catchId)//char(0), cat_sfc2cmem3)
#endif
#endif

#if ( defined SM_NOAH_3_3 )
#if ( defined RM_RTM_FORWARD )
   call registerlsmf2t(trim(LIS_noah33Id)//"+"&
        //trim(LIS_RTMforwardId)//char(0),noah33_f2t)
#endif

#if ( defined RTMS_CRTM )
   call registerlsm2rtm(trim(LIS_crtmId)//"+"//&
                        trim(LIS_noah33Id)//char(0), noah33_sfc2crtm)
#endif

#if ( defined RTMS_CRTM2 )
   call registerlsm2rtm(trim(LIS_crtm2Id)//"+"//&
                        trim(LIS_noah33Id)//char(0), noah33_sfc2crtm)
#endif

#if ( defined RTMS_CRTM2EM )
   call registerlsm2rtm(trim(LIS_crtm2EMId)//"+"//&
                        trim(LIS_noah33Id)//char(0), noah33_sfc2crtm)
#endif

#if ( defined RTMS_CMEM )
   call registerlsm2rtm(trim(LIS_cmem3Id)//"+"//&
        trim(LIS_noah33Id)//char(0), noah33_sfc2cmem3)
#endif

#if ( defined RTMS_TAU_OMEGA )
   call registerlsm2rtm(trim(LIS_tauomegaRTMId)//"+"//&
        trim(LIS_noah33Id)//char(0), noah33_sfc2tauomega)
#endif
#endif

#if ( defined SM_MOSAIC )
#if ( defined RM_RTM_FORWARD )
   call registerlsmf2t(trim(LIS_mosaicId)//"+"//&
                       trim(LIS_RTMforwardId)//char(0),mos_f2t)
#endif

#if ( defined RTMS_CMEM )
   call registerlsm2rtm(trim(LIS_cmem3Id)//"+"//&
                        trim(LIS_mosaicId)//char(0), mos_sfc2cmem3)
#endif
#endif
#endif
end subroutine LIS_lsmrtm_plugin

end module LIS_lsmrtm_pluginMod
