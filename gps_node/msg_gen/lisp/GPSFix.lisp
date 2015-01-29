; Auto-generated. Do not edit!


(cl:in-package gps_node-msg)


;//! \htmlinclude GPSFix.msg.html

(cl:defclass <GPSFix> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (status
    :reader status
    :initarg :status
    :type gps_node-msg:GPSStatus
    :initform (cl:make-instance 'gps_node-msg:GPSStatus))
   (latitude
    :reader latitude
    :initarg :latitude
    :type cl:float
    :initform 0.0)
   (longitude
    :reader longitude
    :initarg :longitude
    :type cl:float
    :initform 0.0)
   (altitude
    :reader altitude
    :initarg :altitude
    :type cl:float
    :initform 0.0)
   (track
    :reader track
    :initarg :track
    :type cl:float
    :initform 0.0)
   (speed
    :reader speed
    :initarg :speed
    :type cl:float
    :initform 0.0)
   (climb
    :reader climb
    :initarg :climb
    :type cl:float
    :initform 0.0)
   (pitch
    :reader pitch
    :initarg :pitch
    :type cl:float
    :initform 0.0)
   (roll
    :reader roll
    :initarg :roll
    :type cl:float
    :initform 0.0)
   (dip
    :reader dip
    :initarg :dip
    :type cl:float
    :initform 0.0)
   (time
    :reader time
    :initarg :time
    :type cl:float
    :initform 0.0)
   (gdop
    :reader gdop
    :initarg :gdop
    :type cl:float
    :initform 0.0)
   (pdop
    :reader pdop
    :initarg :pdop
    :type cl:float
    :initform 0.0)
   (hdop
    :reader hdop
    :initarg :hdop
    :type cl:float
    :initform 0.0)
   (vdop
    :reader vdop
    :initarg :vdop
    :type cl:float
    :initform 0.0)
   (tdop
    :reader tdop
    :initarg :tdop
    :type cl:float
    :initform 0.0)
   (err
    :reader err
    :initarg :err
    :type cl:float
    :initform 0.0)
   (err_horz
    :reader err_horz
    :initarg :err_horz
    :type cl:float
    :initform 0.0)
   (err_vert
    :reader err_vert
    :initarg :err_vert
    :type cl:float
    :initform 0.0)
   (err_track
    :reader err_track
    :initarg :err_track
    :type cl:float
    :initform 0.0)
   (err_speed
    :reader err_speed
    :initarg :err_speed
    :type cl:float
    :initform 0.0)
   (err_climb
    :reader err_climb
    :initarg :err_climb
    :type cl:float
    :initform 0.0)
   (err_time
    :reader err_time
    :initarg :err_time
    :type cl:float
    :initform 0.0)
   (err_pitch
    :reader err_pitch
    :initarg :err_pitch
    :type cl:float
    :initform 0.0)
   (err_roll
    :reader err_roll
    :initarg :err_roll
    :type cl:float
    :initform 0.0)
   (err_dip
    :reader err_dip
    :initarg :err_dip
    :type cl:float
    :initform 0.0)
   (position_covariance
    :reader position_covariance
    :initarg :position_covariance
    :type (cl:vector cl:float)
   :initform (cl:make-array 9 :element-type 'cl:float :initial-element 0.0))
   (position_covariance_type
    :reader position_covariance_type
    :initarg :position_covariance_type
    :type cl:fixnum
    :initform 0)
   (lastRawData
    :reader lastRawData
    :initarg :lastRawData
    :type cl:string
    :initform "")
   (rmc1UTCTime
    :reader rmc1UTCTime
    :initarg :rmc1UTCTime
    :type cl:string
    :initform "")
   (rmc2STatus
    :reader rmc2STatus
    :initarg :rmc2STatus
    :type cl:string
    :initform "")
   (rmc3Latitude
    :reader rmc3Latitude
    :initarg :rmc3Latitude
    :type cl:string
    :initform "")
   (rmc4LatNorS
    :reader rmc4LatNorS
    :initarg :rmc4LatNorS
    :type cl:string
    :initform "")
   (rmc5Longitude
    :reader rmc5Longitude
    :initarg :rmc5Longitude
    :type cl:string
    :initform "")
   (rmc6LongEorW
    :reader rmc6LongEorW
    :initarg :rmc6LongEorW
    :type cl:string
    :initform "")
   (rmc7SpeedOverGroundInKnots
    :reader rmc7SpeedOverGroundInKnots
    :initarg :rmc7SpeedOverGroundInKnots
    :type cl:string
    :initform "")
   (rmc8TrackMadeGoodDegreeTrue
    :reader rmc8TrackMadeGoodDegreeTrue
    :initarg :rmc8TrackMadeGoodDegreeTrue
    :type cl:string
    :initform "")
   (rmc9Date
    :reader rmc9Date
    :initarg :rmc9Date
    :type cl:string
    :initform "")
   (rmc10MagneticVariationDegrees
    :reader rmc10MagneticVariationDegrees
    :initarg :rmc10MagneticVariationDegrees
    :type cl:string
    :initform "")
   (rmc11MagnetEorW
    :reader rmc11MagnetEorW
    :initarg :rmc11MagnetEorW
    :type cl:string
    :initform "")
   (rmc12FAAModeIndicator
    :reader rmc12FAAModeIndicator
    :initarg :rmc12FAAModeIndicator
    :type cl:string
    :initform "")
   (gga1UTC
    :reader gga1UTC
    :initarg :gga1UTC
    :type cl:string
    :initform "")
   (gga2Latitude
    :reader gga2Latitude
    :initarg :gga2Latitude
    :type cl:string
    :initform "")
   (gga3LatNorS
    :reader gga3LatNorS
    :initarg :gga3LatNorS
    :type cl:string
    :initform "")
   (gga4Longitude
    :reader gga4Longitude
    :initarg :gga4Longitude
    :type cl:string
    :initform "")
   (gga5LongEorW
    :reader gga5LongEorW
    :initarg :gga5LongEorW
    :type cl:string
    :initform "")
   (gga6GPSQuality
    :reader gga6GPSQuality
    :initarg :gga6GPSQuality
    :type cl:string
    :initform "")
   (gga6GPSQualityStatus
    :reader gga6GPSQualityStatus
    :initarg :gga6GPSQualityStatus
    :type cl:string
    :initform "")
   (gga7NumberOfSatellites
    :reader gga7NumberOfSatellites
    :initarg :gga7NumberOfSatellites
    :type cl:string
    :initform "")
   (gga8HorizontalDilutionOfPrescision
    :reader gga8HorizontalDilutionOfPrescision
    :initarg :gga8HorizontalDilutionOfPrescision
    :type cl:string
    :initform "")
   (gga9AntennaAltitudeAboveBelowMeanSeaLevel
    :reader gga9AntennaAltitudeAboveBelowMeanSeaLevel
    :initarg :gga9AntennaAltitudeAboveBelowMeanSeaLevel
    :type cl:string
    :initform "")
   (gga10UnitsOfAntennaAltitude_inMeters
    :reader gga10UnitsOfAntennaAltitude_inMeters
    :initarg :gga10UnitsOfAntennaAltitude_inMeters
    :type cl:string
    :initform "")
   (gga11GeoidalSeparation
    :reader gga11GeoidalSeparation
    :initarg :gga11GeoidalSeparation
    :type cl:string
    :initform "")
   (gga12UnitsOfGeoidalSeperation
    :reader gga12UnitsOfGeoidalSeperation
    :initarg :gga12UnitsOfGeoidalSeperation
    :type cl:string
    :initform "")
   (gga13AgeOfDifferentialGPSData
    :reader gga13AgeOfDifferentialGPSData
    :initarg :gga13AgeOfDifferentialGPSData
    :type cl:string
    :initform "")
   (gga14DifferentialReferenceStationID
    :reader gga14DifferentialReferenceStationID
    :initarg :gga14DifferentialReferenceStationID
    :type cl:string
    :initform "")
   (gsa1SelectionMode
    :reader gsa1SelectionMode
    :initarg :gsa1SelectionMode
    :type cl:string
    :initform "")
   (gsa2Mode
    :reader gsa2Mode
    :initarg :gsa2Mode
    :type cl:string
    :initform "")
   (gsa3ID1
    :reader gsa3ID1
    :initarg :gsa3ID1
    :type cl:string
    :initform "")
   (gsa4ID2
    :reader gsa4ID2
    :initarg :gsa4ID2
    :type cl:string
    :initform "")
   (gsa5ID3
    :reader gsa5ID3
    :initarg :gsa5ID3
    :type cl:string
    :initform "")
   (gsa6ID4
    :reader gsa6ID4
    :initarg :gsa6ID4
    :type cl:string
    :initform "")
   (gsa7ID5
    :reader gsa7ID5
    :initarg :gsa7ID5
    :type cl:string
    :initform "")
   (gsa8ID6
    :reader gsa8ID6
    :initarg :gsa8ID6
    :type cl:string
    :initform "")
   (gsa9ID7
    :reader gsa9ID7
    :initarg :gsa9ID7
    :type cl:string
    :initform "")
   (gsa10ID8
    :reader gsa10ID8
    :initarg :gsa10ID8
    :type cl:string
    :initform "")
   (gsa11ID9
    :reader gsa11ID9
    :initarg :gsa11ID9
    :type cl:string
    :initform "")
   (gsa12ID10
    :reader gsa12ID10
    :initarg :gsa12ID10
    :type cl:string
    :initform "")
   (gsa13ID11
    :reader gsa13ID11
    :initarg :gsa13ID11
    :type cl:string
    :initform "")
   (gsa14ID12
    :reader gsa14ID12
    :initarg :gsa14ID12
    :type cl:string
    :initform "")
   (gsa15PDOP
    :reader gsa15PDOP
    :initarg :gsa15PDOP
    :type cl:string
    :initform "")
   (gsa16HDOP
    :reader gsa16HDOP
    :initarg :gsa16HDOP
    :type cl:string
    :initform "")
   (gsa17VDOP
    :reader gsa17VDOP
    :initarg :gsa17VDOP
    :type cl:string
    :initform "")
   (gsvAdet
    :reader gsvAdet
    :initarg :gsvAdet
    :type cl:fixnum
    :initform 0)
   (gsv1NumberOfGSV
    :reader gsv1NumberOfGSV
    :initarg :gsv1NumberOfGSV
    :type cl:string
    :initform "")
   (gsv2NumberOfMessage
    :reader gsv2NumberOfMessage
    :initarg :gsv2NumberOfMessage
    :type cl:string
    :initform "")
   (gsv3NumberOfStallitesInView
    :reader gsv3NumberOfStallitesInView
    :initarg :gsv3NumberOfStallitesInView
    :type cl:string
    :initform "")
   (gsv4SatellitePRNNumber
    :reader gsv4SatellitePRNNumber
    :initarg :gsv4SatellitePRNNumber
    :type cl:string
    :initform "")
   (gsv5ElevationDegrees
    :reader gsv5ElevationDegrees
    :initarg :gsv5ElevationDegrees
    :type cl:string
    :initform "")
   (gsv6AzimuthIndegries
    :reader gsv6AzimuthIndegries
    :initarg :gsv6AzimuthIndegries
    :type cl:string
    :initform "")
   (gsv7SRNin_dB
    :reader gsv7SRNin_dB
    :initarg :gsv7SRNin_dB
    :type cl:string
    :initform "")
   (gsv8MoreSatelliteInfoQuadruples
    :reader gsv8MoreSatelliteInfoQuadruples
    :initarg :gsv8MoreSatelliteInfoQuadruples
    :type cl:string
    :initform ""))
)

(cl:defclass GPSFix (<GPSFix>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GPSFix>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GPSFix)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gps_node-msg:<GPSFix> is deprecated: use gps_node-msg:GPSFix instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:header-val is deprecated.  Use gps_node-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:status-val is deprecated.  Use gps_node-msg:status instead.")
  (status m))

(cl:ensure-generic-function 'latitude-val :lambda-list '(m))
(cl:defmethod latitude-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:latitude-val is deprecated.  Use gps_node-msg:latitude instead.")
  (latitude m))

(cl:ensure-generic-function 'longitude-val :lambda-list '(m))
(cl:defmethod longitude-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:longitude-val is deprecated.  Use gps_node-msg:longitude instead.")
  (longitude m))

(cl:ensure-generic-function 'altitude-val :lambda-list '(m))
(cl:defmethod altitude-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:altitude-val is deprecated.  Use gps_node-msg:altitude instead.")
  (altitude m))

(cl:ensure-generic-function 'track-val :lambda-list '(m))
(cl:defmethod track-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:track-val is deprecated.  Use gps_node-msg:track instead.")
  (track m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:speed-val is deprecated.  Use gps_node-msg:speed instead.")
  (speed m))

(cl:ensure-generic-function 'climb-val :lambda-list '(m))
(cl:defmethod climb-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:climb-val is deprecated.  Use gps_node-msg:climb instead.")
  (climb m))

(cl:ensure-generic-function 'pitch-val :lambda-list '(m))
(cl:defmethod pitch-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:pitch-val is deprecated.  Use gps_node-msg:pitch instead.")
  (pitch m))

(cl:ensure-generic-function 'roll-val :lambda-list '(m))
(cl:defmethod roll-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:roll-val is deprecated.  Use gps_node-msg:roll instead.")
  (roll m))

(cl:ensure-generic-function 'dip-val :lambda-list '(m))
(cl:defmethod dip-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:dip-val is deprecated.  Use gps_node-msg:dip instead.")
  (dip m))

(cl:ensure-generic-function 'time-val :lambda-list '(m))
(cl:defmethod time-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:time-val is deprecated.  Use gps_node-msg:time instead.")
  (time m))

(cl:ensure-generic-function 'gdop-val :lambda-list '(m))
(cl:defmethod gdop-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gdop-val is deprecated.  Use gps_node-msg:gdop instead.")
  (gdop m))

(cl:ensure-generic-function 'pdop-val :lambda-list '(m))
(cl:defmethod pdop-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:pdop-val is deprecated.  Use gps_node-msg:pdop instead.")
  (pdop m))

(cl:ensure-generic-function 'hdop-val :lambda-list '(m))
(cl:defmethod hdop-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:hdop-val is deprecated.  Use gps_node-msg:hdop instead.")
  (hdop m))

(cl:ensure-generic-function 'vdop-val :lambda-list '(m))
(cl:defmethod vdop-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:vdop-val is deprecated.  Use gps_node-msg:vdop instead.")
  (vdop m))

(cl:ensure-generic-function 'tdop-val :lambda-list '(m))
(cl:defmethod tdop-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:tdop-val is deprecated.  Use gps_node-msg:tdop instead.")
  (tdop m))

(cl:ensure-generic-function 'err-val :lambda-list '(m))
(cl:defmethod err-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:err-val is deprecated.  Use gps_node-msg:err instead.")
  (err m))

(cl:ensure-generic-function 'err_horz-val :lambda-list '(m))
(cl:defmethod err_horz-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:err_horz-val is deprecated.  Use gps_node-msg:err_horz instead.")
  (err_horz m))

(cl:ensure-generic-function 'err_vert-val :lambda-list '(m))
(cl:defmethod err_vert-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:err_vert-val is deprecated.  Use gps_node-msg:err_vert instead.")
  (err_vert m))

(cl:ensure-generic-function 'err_track-val :lambda-list '(m))
(cl:defmethod err_track-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:err_track-val is deprecated.  Use gps_node-msg:err_track instead.")
  (err_track m))

(cl:ensure-generic-function 'err_speed-val :lambda-list '(m))
(cl:defmethod err_speed-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:err_speed-val is deprecated.  Use gps_node-msg:err_speed instead.")
  (err_speed m))

(cl:ensure-generic-function 'err_climb-val :lambda-list '(m))
(cl:defmethod err_climb-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:err_climb-val is deprecated.  Use gps_node-msg:err_climb instead.")
  (err_climb m))

(cl:ensure-generic-function 'err_time-val :lambda-list '(m))
(cl:defmethod err_time-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:err_time-val is deprecated.  Use gps_node-msg:err_time instead.")
  (err_time m))

(cl:ensure-generic-function 'err_pitch-val :lambda-list '(m))
(cl:defmethod err_pitch-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:err_pitch-val is deprecated.  Use gps_node-msg:err_pitch instead.")
  (err_pitch m))

(cl:ensure-generic-function 'err_roll-val :lambda-list '(m))
(cl:defmethod err_roll-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:err_roll-val is deprecated.  Use gps_node-msg:err_roll instead.")
  (err_roll m))

(cl:ensure-generic-function 'err_dip-val :lambda-list '(m))
(cl:defmethod err_dip-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:err_dip-val is deprecated.  Use gps_node-msg:err_dip instead.")
  (err_dip m))

(cl:ensure-generic-function 'position_covariance-val :lambda-list '(m))
(cl:defmethod position_covariance-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:position_covariance-val is deprecated.  Use gps_node-msg:position_covariance instead.")
  (position_covariance m))

(cl:ensure-generic-function 'position_covariance_type-val :lambda-list '(m))
(cl:defmethod position_covariance_type-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:position_covariance_type-val is deprecated.  Use gps_node-msg:position_covariance_type instead.")
  (position_covariance_type m))

(cl:ensure-generic-function 'lastRawData-val :lambda-list '(m))
(cl:defmethod lastRawData-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:lastRawData-val is deprecated.  Use gps_node-msg:lastRawData instead.")
  (lastRawData m))

(cl:ensure-generic-function 'rmc1UTCTime-val :lambda-list '(m))
(cl:defmethod rmc1UTCTime-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:rmc1UTCTime-val is deprecated.  Use gps_node-msg:rmc1UTCTime instead.")
  (rmc1UTCTime m))

(cl:ensure-generic-function 'rmc2STatus-val :lambda-list '(m))
(cl:defmethod rmc2STatus-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:rmc2STatus-val is deprecated.  Use gps_node-msg:rmc2STatus instead.")
  (rmc2STatus m))

(cl:ensure-generic-function 'rmc3Latitude-val :lambda-list '(m))
(cl:defmethod rmc3Latitude-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:rmc3Latitude-val is deprecated.  Use gps_node-msg:rmc3Latitude instead.")
  (rmc3Latitude m))

(cl:ensure-generic-function 'rmc4LatNorS-val :lambda-list '(m))
(cl:defmethod rmc4LatNorS-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:rmc4LatNorS-val is deprecated.  Use gps_node-msg:rmc4LatNorS instead.")
  (rmc4LatNorS m))

(cl:ensure-generic-function 'rmc5Longitude-val :lambda-list '(m))
(cl:defmethod rmc5Longitude-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:rmc5Longitude-val is deprecated.  Use gps_node-msg:rmc5Longitude instead.")
  (rmc5Longitude m))

(cl:ensure-generic-function 'rmc6LongEorW-val :lambda-list '(m))
(cl:defmethod rmc6LongEorW-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:rmc6LongEorW-val is deprecated.  Use gps_node-msg:rmc6LongEorW instead.")
  (rmc6LongEorW m))

(cl:ensure-generic-function 'rmc7SpeedOverGroundInKnots-val :lambda-list '(m))
(cl:defmethod rmc7SpeedOverGroundInKnots-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:rmc7SpeedOverGroundInKnots-val is deprecated.  Use gps_node-msg:rmc7SpeedOverGroundInKnots instead.")
  (rmc7SpeedOverGroundInKnots m))

(cl:ensure-generic-function 'rmc8TrackMadeGoodDegreeTrue-val :lambda-list '(m))
(cl:defmethod rmc8TrackMadeGoodDegreeTrue-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:rmc8TrackMadeGoodDegreeTrue-val is deprecated.  Use gps_node-msg:rmc8TrackMadeGoodDegreeTrue instead.")
  (rmc8TrackMadeGoodDegreeTrue m))

(cl:ensure-generic-function 'rmc9Date-val :lambda-list '(m))
(cl:defmethod rmc9Date-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:rmc9Date-val is deprecated.  Use gps_node-msg:rmc9Date instead.")
  (rmc9Date m))

(cl:ensure-generic-function 'rmc10MagneticVariationDegrees-val :lambda-list '(m))
(cl:defmethod rmc10MagneticVariationDegrees-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:rmc10MagneticVariationDegrees-val is deprecated.  Use gps_node-msg:rmc10MagneticVariationDegrees instead.")
  (rmc10MagneticVariationDegrees m))

(cl:ensure-generic-function 'rmc11MagnetEorW-val :lambda-list '(m))
(cl:defmethod rmc11MagnetEorW-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:rmc11MagnetEorW-val is deprecated.  Use gps_node-msg:rmc11MagnetEorW instead.")
  (rmc11MagnetEorW m))

(cl:ensure-generic-function 'rmc12FAAModeIndicator-val :lambda-list '(m))
(cl:defmethod rmc12FAAModeIndicator-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:rmc12FAAModeIndicator-val is deprecated.  Use gps_node-msg:rmc12FAAModeIndicator instead.")
  (rmc12FAAModeIndicator m))

(cl:ensure-generic-function 'gga1UTC-val :lambda-list '(m))
(cl:defmethod gga1UTC-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gga1UTC-val is deprecated.  Use gps_node-msg:gga1UTC instead.")
  (gga1UTC m))

(cl:ensure-generic-function 'gga2Latitude-val :lambda-list '(m))
(cl:defmethod gga2Latitude-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gga2Latitude-val is deprecated.  Use gps_node-msg:gga2Latitude instead.")
  (gga2Latitude m))

(cl:ensure-generic-function 'gga3LatNorS-val :lambda-list '(m))
(cl:defmethod gga3LatNorS-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gga3LatNorS-val is deprecated.  Use gps_node-msg:gga3LatNorS instead.")
  (gga3LatNorS m))

(cl:ensure-generic-function 'gga4Longitude-val :lambda-list '(m))
(cl:defmethod gga4Longitude-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gga4Longitude-val is deprecated.  Use gps_node-msg:gga4Longitude instead.")
  (gga4Longitude m))

(cl:ensure-generic-function 'gga5LongEorW-val :lambda-list '(m))
(cl:defmethod gga5LongEorW-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gga5LongEorW-val is deprecated.  Use gps_node-msg:gga5LongEorW instead.")
  (gga5LongEorW m))

(cl:ensure-generic-function 'gga6GPSQuality-val :lambda-list '(m))
(cl:defmethod gga6GPSQuality-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gga6GPSQuality-val is deprecated.  Use gps_node-msg:gga6GPSQuality instead.")
  (gga6GPSQuality m))

(cl:ensure-generic-function 'gga6GPSQualityStatus-val :lambda-list '(m))
(cl:defmethod gga6GPSQualityStatus-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gga6GPSQualityStatus-val is deprecated.  Use gps_node-msg:gga6GPSQualityStatus instead.")
  (gga6GPSQualityStatus m))

(cl:ensure-generic-function 'gga7NumberOfSatellites-val :lambda-list '(m))
(cl:defmethod gga7NumberOfSatellites-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gga7NumberOfSatellites-val is deprecated.  Use gps_node-msg:gga7NumberOfSatellites instead.")
  (gga7NumberOfSatellites m))

(cl:ensure-generic-function 'gga8HorizontalDilutionOfPrescision-val :lambda-list '(m))
(cl:defmethod gga8HorizontalDilutionOfPrescision-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gga8HorizontalDilutionOfPrescision-val is deprecated.  Use gps_node-msg:gga8HorizontalDilutionOfPrescision instead.")
  (gga8HorizontalDilutionOfPrescision m))

(cl:ensure-generic-function 'gga9AntennaAltitudeAboveBelowMeanSeaLevel-val :lambda-list '(m))
(cl:defmethod gga9AntennaAltitudeAboveBelowMeanSeaLevel-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gga9AntennaAltitudeAboveBelowMeanSeaLevel-val is deprecated.  Use gps_node-msg:gga9AntennaAltitudeAboveBelowMeanSeaLevel instead.")
  (gga9AntennaAltitudeAboveBelowMeanSeaLevel m))

(cl:ensure-generic-function 'gga10UnitsOfAntennaAltitude_inMeters-val :lambda-list '(m))
(cl:defmethod gga10UnitsOfAntennaAltitude_inMeters-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gga10UnitsOfAntennaAltitude_inMeters-val is deprecated.  Use gps_node-msg:gga10UnitsOfAntennaAltitude_inMeters instead.")
  (gga10UnitsOfAntennaAltitude_inMeters m))

(cl:ensure-generic-function 'gga11GeoidalSeparation-val :lambda-list '(m))
(cl:defmethod gga11GeoidalSeparation-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gga11GeoidalSeparation-val is deprecated.  Use gps_node-msg:gga11GeoidalSeparation instead.")
  (gga11GeoidalSeparation m))

(cl:ensure-generic-function 'gga12UnitsOfGeoidalSeperation-val :lambda-list '(m))
(cl:defmethod gga12UnitsOfGeoidalSeperation-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gga12UnitsOfGeoidalSeperation-val is deprecated.  Use gps_node-msg:gga12UnitsOfGeoidalSeperation instead.")
  (gga12UnitsOfGeoidalSeperation m))

(cl:ensure-generic-function 'gga13AgeOfDifferentialGPSData-val :lambda-list '(m))
(cl:defmethod gga13AgeOfDifferentialGPSData-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gga13AgeOfDifferentialGPSData-val is deprecated.  Use gps_node-msg:gga13AgeOfDifferentialGPSData instead.")
  (gga13AgeOfDifferentialGPSData m))

(cl:ensure-generic-function 'gga14DifferentialReferenceStationID-val :lambda-list '(m))
(cl:defmethod gga14DifferentialReferenceStationID-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gga14DifferentialReferenceStationID-val is deprecated.  Use gps_node-msg:gga14DifferentialReferenceStationID instead.")
  (gga14DifferentialReferenceStationID m))

(cl:ensure-generic-function 'gsa1SelectionMode-val :lambda-list '(m))
(cl:defmethod gsa1SelectionMode-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gsa1SelectionMode-val is deprecated.  Use gps_node-msg:gsa1SelectionMode instead.")
  (gsa1SelectionMode m))

(cl:ensure-generic-function 'gsa2Mode-val :lambda-list '(m))
(cl:defmethod gsa2Mode-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gsa2Mode-val is deprecated.  Use gps_node-msg:gsa2Mode instead.")
  (gsa2Mode m))

(cl:ensure-generic-function 'gsa3ID1-val :lambda-list '(m))
(cl:defmethod gsa3ID1-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gsa3ID1-val is deprecated.  Use gps_node-msg:gsa3ID1 instead.")
  (gsa3ID1 m))

(cl:ensure-generic-function 'gsa4ID2-val :lambda-list '(m))
(cl:defmethod gsa4ID2-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gsa4ID2-val is deprecated.  Use gps_node-msg:gsa4ID2 instead.")
  (gsa4ID2 m))

(cl:ensure-generic-function 'gsa5ID3-val :lambda-list '(m))
(cl:defmethod gsa5ID3-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gsa5ID3-val is deprecated.  Use gps_node-msg:gsa5ID3 instead.")
  (gsa5ID3 m))

(cl:ensure-generic-function 'gsa6ID4-val :lambda-list '(m))
(cl:defmethod gsa6ID4-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gsa6ID4-val is deprecated.  Use gps_node-msg:gsa6ID4 instead.")
  (gsa6ID4 m))

(cl:ensure-generic-function 'gsa7ID5-val :lambda-list '(m))
(cl:defmethod gsa7ID5-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gsa7ID5-val is deprecated.  Use gps_node-msg:gsa7ID5 instead.")
  (gsa7ID5 m))

(cl:ensure-generic-function 'gsa8ID6-val :lambda-list '(m))
(cl:defmethod gsa8ID6-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gsa8ID6-val is deprecated.  Use gps_node-msg:gsa8ID6 instead.")
  (gsa8ID6 m))

(cl:ensure-generic-function 'gsa9ID7-val :lambda-list '(m))
(cl:defmethod gsa9ID7-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gsa9ID7-val is deprecated.  Use gps_node-msg:gsa9ID7 instead.")
  (gsa9ID7 m))

(cl:ensure-generic-function 'gsa10ID8-val :lambda-list '(m))
(cl:defmethod gsa10ID8-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gsa10ID8-val is deprecated.  Use gps_node-msg:gsa10ID8 instead.")
  (gsa10ID8 m))

(cl:ensure-generic-function 'gsa11ID9-val :lambda-list '(m))
(cl:defmethod gsa11ID9-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gsa11ID9-val is deprecated.  Use gps_node-msg:gsa11ID9 instead.")
  (gsa11ID9 m))

(cl:ensure-generic-function 'gsa12ID10-val :lambda-list '(m))
(cl:defmethod gsa12ID10-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gsa12ID10-val is deprecated.  Use gps_node-msg:gsa12ID10 instead.")
  (gsa12ID10 m))

(cl:ensure-generic-function 'gsa13ID11-val :lambda-list '(m))
(cl:defmethod gsa13ID11-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gsa13ID11-val is deprecated.  Use gps_node-msg:gsa13ID11 instead.")
  (gsa13ID11 m))

(cl:ensure-generic-function 'gsa14ID12-val :lambda-list '(m))
(cl:defmethod gsa14ID12-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gsa14ID12-val is deprecated.  Use gps_node-msg:gsa14ID12 instead.")
  (gsa14ID12 m))

(cl:ensure-generic-function 'gsa15PDOP-val :lambda-list '(m))
(cl:defmethod gsa15PDOP-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gsa15PDOP-val is deprecated.  Use gps_node-msg:gsa15PDOP instead.")
  (gsa15PDOP m))

(cl:ensure-generic-function 'gsa16HDOP-val :lambda-list '(m))
(cl:defmethod gsa16HDOP-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gsa16HDOP-val is deprecated.  Use gps_node-msg:gsa16HDOP instead.")
  (gsa16HDOP m))

(cl:ensure-generic-function 'gsa17VDOP-val :lambda-list '(m))
(cl:defmethod gsa17VDOP-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gsa17VDOP-val is deprecated.  Use gps_node-msg:gsa17VDOP instead.")
  (gsa17VDOP m))

(cl:ensure-generic-function 'gsvAdet-val :lambda-list '(m))
(cl:defmethod gsvAdet-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gsvAdet-val is deprecated.  Use gps_node-msg:gsvAdet instead.")
  (gsvAdet m))

(cl:ensure-generic-function 'gsv1NumberOfGSV-val :lambda-list '(m))
(cl:defmethod gsv1NumberOfGSV-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gsv1NumberOfGSV-val is deprecated.  Use gps_node-msg:gsv1NumberOfGSV instead.")
  (gsv1NumberOfGSV m))

(cl:ensure-generic-function 'gsv2NumberOfMessage-val :lambda-list '(m))
(cl:defmethod gsv2NumberOfMessage-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gsv2NumberOfMessage-val is deprecated.  Use gps_node-msg:gsv2NumberOfMessage instead.")
  (gsv2NumberOfMessage m))

(cl:ensure-generic-function 'gsv3NumberOfStallitesInView-val :lambda-list '(m))
(cl:defmethod gsv3NumberOfStallitesInView-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gsv3NumberOfStallitesInView-val is deprecated.  Use gps_node-msg:gsv3NumberOfStallitesInView instead.")
  (gsv3NumberOfStallitesInView m))

(cl:ensure-generic-function 'gsv4SatellitePRNNumber-val :lambda-list '(m))
(cl:defmethod gsv4SatellitePRNNumber-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gsv4SatellitePRNNumber-val is deprecated.  Use gps_node-msg:gsv4SatellitePRNNumber instead.")
  (gsv4SatellitePRNNumber m))

(cl:ensure-generic-function 'gsv5ElevationDegrees-val :lambda-list '(m))
(cl:defmethod gsv5ElevationDegrees-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gsv5ElevationDegrees-val is deprecated.  Use gps_node-msg:gsv5ElevationDegrees instead.")
  (gsv5ElevationDegrees m))

(cl:ensure-generic-function 'gsv6AzimuthIndegries-val :lambda-list '(m))
(cl:defmethod gsv6AzimuthIndegries-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gsv6AzimuthIndegries-val is deprecated.  Use gps_node-msg:gsv6AzimuthIndegries instead.")
  (gsv6AzimuthIndegries m))

(cl:ensure-generic-function 'gsv7SRNin_dB-val :lambda-list '(m))
(cl:defmethod gsv7SRNin_dB-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gsv7SRNin_dB-val is deprecated.  Use gps_node-msg:gsv7SRNin_dB instead.")
  (gsv7SRNin_dB m))

(cl:ensure-generic-function 'gsv8MoreSatelliteInfoQuadruples-val :lambda-list '(m))
(cl:defmethod gsv8MoreSatelliteInfoQuadruples-val ((m <GPSFix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps_node-msg:gsv8MoreSatelliteInfoQuadruples-val is deprecated.  Use gps_node-msg:gsv8MoreSatelliteInfoQuadruples instead.")
  (gsv8MoreSatelliteInfoQuadruples m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<GPSFix>)))
    "Constants for message type '<GPSFix>"
  '((:COVARIANCE_TYPE_UNKNOWN . 0)
    (:COVARIANCE_TYPE_APPROXIMATED . 1)
    (:COVARIANCE_TYPE_DIAGONAL_KNOWN . 2)
    (:COVARIANCE_TYPE_KNOWN . 3))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'GPSFix)))
    "Constants for message type 'GPSFix"
  '((:COVARIANCE_TYPE_UNKNOWN . 0)
    (:COVARIANCE_TYPE_APPROXIMATED . 1)
    (:COVARIANCE_TYPE_DIAGONAL_KNOWN . 2)
    (:COVARIANCE_TYPE_KNOWN . 3))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GPSFix>) ostream)
  "Serializes a message object of type '<GPSFix>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'status) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'latitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'longitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'altitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'track))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'climb))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'roll))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'dip))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'gdop))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pdop))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'hdop))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'vdop))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'tdop))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'err))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'err_horz))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'err_vert))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'err_track))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'err_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'err_climb))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'err_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'err_pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'err_roll))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'err_dip))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'position_covariance))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'position_covariance_type)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'lastRawData))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'lastRawData))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'rmc1UTCTime))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'rmc1UTCTime))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'rmc2STatus))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'rmc2STatus))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'rmc3Latitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'rmc3Latitude))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'rmc4LatNorS))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'rmc4LatNorS))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'rmc5Longitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'rmc5Longitude))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'rmc6LongEorW))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'rmc6LongEorW))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'rmc7SpeedOverGroundInKnots))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'rmc7SpeedOverGroundInKnots))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'rmc8TrackMadeGoodDegreeTrue))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'rmc8TrackMadeGoodDegreeTrue))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'rmc9Date))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'rmc9Date))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'rmc10MagneticVariationDegrees))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'rmc10MagneticVariationDegrees))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'rmc11MagnetEorW))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'rmc11MagnetEorW))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'rmc12FAAModeIndicator))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'rmc12FAAModeIndicator))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gga1UTC))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gga1UTC))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gga2Latitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gga2Latitude))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gga3LatNorS))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gga3LatNorS))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gga4Longitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gga4Longitude))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gga5LongEorW))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gga5LongEorW))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gga6GPSQuality))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gga6GPSQuality))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gga6GPSQualityStatus))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gga6GPSQualityStatus))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gga7NumberOfSatellites))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gga7NumberOfSatellites))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gga8HorizontalDilutionOfPrescision))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gga8HorizontalDilutionOfPrescision))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gga9AntennaAltitudeAboveBelowMeanSeaLevel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gga9AntennaAltitudeAboveBelowMeanSeaLevel))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gga10UnitsOfAntennaAltitude_inMeters))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gga10UnitsOfAntennaAltitude_inMeters))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gga11GeoidalSeparation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gga11GeoidalSeparation))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gga12UnitsOfGeoidalSeperation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gga12UnitsOfGeoidalSeperation))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gga13AgeOfDifferentialGPSData))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gga13AgeOfDifferentialGPSData))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gga14DifferentialReferenceStationID))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gga14DifferentialReferenceStationID))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gsa1SelectionMode))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gsa1SelectionMode))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gsa2Mode))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gsa2Mode))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gsa3ID1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gsa3ID1))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gsa4ID2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gsa4ID2))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gsa5ID3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gsa5ID3))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gsa6ID4))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gsa6ID4))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gsa7ID5))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gsa7ID5))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gsa8ID6))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gsa8ID6))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gsa9ID7))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gsa9ID7))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gsa10ID8))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gsa10ID8))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gsa11ID9))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gsa11ID9))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gsa12ID10))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gsa12ID10))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gsa13ID11))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gsa13ID11))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gsa14ID12))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gsa14ID12))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gsa15PDOP))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gsa15PDOP))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gsa16HDOP))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gsa16HDOP))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gsa17VDOP))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gsa17VDOP))
  (cl:let* ((signed (cl:slot-value msg 'gsvAdet)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gsv1NumberOfGSV))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gsv1NumberOfGSV))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gsv2NumberOfMessage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gsv2NumberOfMessage))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gsv3NumberOfStallitesInView))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gsv3NumberOfStallitesInView))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gsv4SatellitePRNNumber))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gsv4SatellitePRNNumber))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gsv5ElevationDegrees))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gsv5ElevationDegrees))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gsv6AzimuthIndegries))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gsv6AzimuthIndegries))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gsv7SRNin_dB))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gsv7SRNin_dB))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gsv8MoreSatelliteInfoQuadruples))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gsv8MoreSatelliteInfoQuadruples))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GPSFix>) istream)
  "Deserializes a message object of type '<GPSFix>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'status) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'latitude) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'longitude) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'altitude) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'track) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'climb) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitch) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'roll) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dip) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'time) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'gdop) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pdop) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'hdop) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vdop) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'tdop) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'err) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'err_horz) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'err_vert) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'err_track) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'err_speed) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'err_climb) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'err_time) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'err_pitch) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'err_roll) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'err_dip) (roslisp-utils:decode-double-float-bits bits)))
  (cl:setf (cl:slot-value msg 'position_covariance) (cl:make-array 9))
  (cl:let ((vals (cl:slot-value msg 'position_covariance)))
    (cl:dotimes (i 9)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'position_covariance_type)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'lastRawData) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'lastRawData) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rmc1UTCTime) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'rmc1UTCTime) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rmc2STatus) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'rmc2STatus) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rmc3Latitude) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'rmc3Latitude) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rmc4LatNorS) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'rmc4LatNorS) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rmc5Longitude) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'rmc5Longitude) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rmc6LongEorW) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'rmc6LongEorW) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rmc7SpeedOverGroundInKnots) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'rmc7SpeedOverGroundInKnots) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rmc8TrackMadeGoodDegreeTrue) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'rmc8TrackMadeGoodDegreeTrue) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rmc9Date) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'rmc9Date) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rmc10MagneticVariationDegrees) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'rmc10MagneticVariationDegrees) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rmc11MagnetEorW) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'rmc11MagnetEorW) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rmc12FAAModeIndicator) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'rmc12FAAModeIndicator) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gga1UTC) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gga1UTC) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gga2Latitude) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gga2Latitude) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gga3LatNorS) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gga3LatNorS) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gga4Longitude) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gga4Longitude) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gga5LongEorW) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gga5LongEorW) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gga6GPSQuality) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gga6GPSQuality) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gga6GPSQualityStatus) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gga6GPSQualityStatus) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gga7NumberOfSatellites) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gga7NumberOfSatellites) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gga8HorizontalDilutionOfPrescision) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gga8HorizontalDilutionOfPrescision) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gga9AntennaAltitudeAboveBelowMeanSeaLevel) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gga9AntennaAltitudeAboveBelowMeanSeaLevel) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gga10UnitsOfAntennaAltitude_inMeters) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gga10UnitsOfAntennaAltitude_inMeters) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gga11GeoidalSeparation) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gga11GeoidalSeparation) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gga12UnitsOfGeoidalSeperation) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gga12UnitsOfGeoidalSeperation) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gga13AgeOfDifferentialGPSData) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gga13AgeOfDifferentialGPSData) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gga14DifferentialReferenceStationID) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gga14DifferentialReferenceStationID) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gsa1SelectionMode) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gsa1SelectionMode) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gsa2Mode) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gsa2Mode) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gsa3ID1) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gsa3ID1) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gsa4ID2) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gsa4ID2) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gsa5ID3) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gsa5ID3) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gsa6ID4) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gsa6ID4) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gsa7ID5) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gsa7ID5) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gsa8ID6) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gsa8ID6) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gsa9ID7) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gsa9ID7) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gsa10ID8) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gsa10ID8) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gsa11ID9) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gsa11ID9) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gsa12ID10) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gsa12ID10) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gsa13ID11) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gsa13ID11) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gsa14ID12) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gsa14ID12) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gsa15PDOP) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gsa15PDOP) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gsa16HDOP) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gsa16HDOP) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gsa17VDOP) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gsa17VDOP) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gsvAdet) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gsv1NumberOfGSV) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gsv1NumberOfGSV) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gsv2NumberOfMessage) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gsv2NumberOfMessage) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gsv3NumberOfStallitesInView) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gsv3NumberOfStallitesInView) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gsv4SatellitePRNNumber) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gsv4SatellitePRNNumber) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gsv5ElevationDegrees) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gsv5ElevationDegrees) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gsv6AzimuthIndegries) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gsv6AzimuthIndegries) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gsv7SRNin_dB) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gsv7SRNin_dB) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gsv8MoreSatelliteInfoQuadruples) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gsv8MoreSatelliteInfoQuadruples) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GPSFix>)))
  "Returns string type for a message object of type '<GPSFix>"
  "gps_node/GPSFix")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GPSFix)))
  "Returns string type for a message object of type 'GPSFix"
  "gps_node/GPSFix")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GPSFix>)))
  "Returns md5sum for a message object of type '<GPSFix>"
  "7d80aa63f37a9b7b932b38216fc5314b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GPSFix)))
  "Returns md5sum for a message object of type 'GPSFix"
  "7d80aa63f37a9b7b932b38216fc5314b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GPSFix>)))
  "Returns full string definition for message of type '<GPSFix>"
  (cl:format cl:nil "# A more complete GPS fix to supplement sensor_msgs/NavSatFix.~%Header header~%~%GPSStatus status~%~%# Latitude (degrees). Positive is north of equator; negative is south.~%float64 latitude~%~%# Longitude (degrees). Positive is east of prime meridian, negative west.~%float64 longitude~%~%# Altitude (meters). Positive is above reference (e.g., sea level).~%float64 altitude~%~%# Direction (degrees from north)~%float64 track~%~%# Ground speed (meters/second)~%float64 speed~%~%# Vertical speed (meters/second)~%float64 climb~%~%# Device orientation (units in degrees)~%float64 pitch~%float64 roll~%float64 dip~%~%# GPS time~%float64 time~%~%## Dilution of precision; Xdop<=0 means the value is unknown~%~%# Total (positional-temporal) dilution of precision~%float64 gdop~%~%# Positional (3D) dilution of precision~%float64 pdop~%~%# Horizontal dilution of precision~%float64 hdop~%~%# Vertical dilution of precision~%float64 vdop~%~%# Temporal dilution of precision~%float64 tdop~%~%## Uncertainty of measurement, 95% confidence~%~%# Spherical position uncertainty (meters) [epe]~%float64 err~%~%# Horizontal position uncertainty (meters) [eph]~%float64 err_horz~%~%# Vertical position uncertainty (meters) [epv]~%float64 err_vert~%~%# Track uncertainty (degrees) [epd]~%float64 err_track~%~%# Ground speed uncertainty (meters/second) [eps]~%float64 err_speed~%~%# Vertical speed uncertainty (meters/second) [epc]~%float64 err_climb~%~%# Temporal uncertainty [ept]~%float64 err_time~%~%# Orientation uncertainty (degrees)~%float64 err_pitch~%float64 err_roll~%float64 err_dip~%~%# Position covariance [m^2] defined relative to a tangential plane~%# through the reported position. The components are East, North, and~%# Up (ENU), in row-major order.~%~%float64[9] position_covariance~%~%uint8 COVARIANCE_TYPE_UNKNOWN = 0~%uint8 COVARIANCE_TYPE_APPROXIMATED = 1~%uint8 COVARIANCE_TYPE_DIAGONAL_KNOWN = 2~%uint8 COVARIANCE_TYPE_KNOWN = 3~%~%uint8 position_covariance_type~%~%string lastRawData~%###############################################################################~%#=== RMC - Recommended Minimum Navigation Information ===~%#~%#------------------------------------------------------------------------------~%#                                                          12~%#        1         2 3       4 5        6  7   8   9    10 11|  13~%#        |         | |       | |        |  |   |   |    |  | |   |~%# $--RMC,hhmmss.ss,A,llll.ll,a,yyyyy.yy,a,x.x,x.x,xxxx,x.x,a,m,*hh<CR><LF>~%#------------------------------------------------------------------------------#~%#~%#Field Number:~%#~%#1. UTC Time~%string rmc1UTCTime~%#2. Status, V=Navigation receiver warning A=Valid~%string rmc2STatus~%#3. Latitude~%string rmc3Latitude~%#4. N or S~%string rmc4LatNorS~%#5. Longitude~%string rmc5Longitude~%#6. E or W~%string rmc6LongEorW~%#7. Speed over ground, knots~%string rmc7SpeedOverGroundInKnots~%#8. Track made good, degrees true~%string rmc8TrackMadeGoodDegreeTrue~%#9. Date, ddmmyy~%string rmc9Date~%#10. Magnetic Variation, degrees~%string rmc10MagneticVariationDegrees~%#11. E or W~%string rmc11MagnetEorW~%#12. FAA mode indicator (NMEA 2.3 and later)~%string rmc12FAAModeIndicator~%#13. Checksum~%###############################################################################~%#                                                      11~%#        1         2       3 4        5 6 7  8   9  10 |  12 13  14   15~%#        |         |       | |        | | |  |   |   | |   | |   |    |~%# $--GGA,hhmmss.ss,llll.ll,a,yyyyy.yy,a,x,xx,x.x,x.x,M,x.x,M,x.x,xxxx*hh<CR><LF>~%#------------------------------------------------------------------------------~%#~%#Field Number:~%#1. Universal Time Coordinated (UTC)~%string gga1UTC~%#2. Latitude~%string gga2Latitude~%#3. N or S (North or South)~%string gga3LatNorS~%#4. Longitude~%string gga4Longitude~%#5. E or W (East or West)~%string gga5LongEorW~%#6. GPS Quality Indicator,~%string gga6GPSQuality~%string gga6GPSQualityStatus~%#     - 0 - fix not available,~%#     - 1 - GPS fix,~%#     - 2 - Differential GPS fix~%#           (values above 2 are 2.3 features)~%#     - 3 = PPS fix~%#     - 4 = Real Time Kinematic~%#     - 5 = Float RTK~%#     - 6 = estimated (dead reckoning)~%#     - 7 = Manual input mode~%#     - 8 = Simulation mode~%#7. Number of satellites in view, 00 - 12~%string gga7NumberOfSatellites~%#8. Horizontal Dilution of precision (meters)~%string gga8HorizontalDilutionOfPrescision~%#9. Antenna Altitude above/below mean-sea-level (geoid) (in meters)~%string gga9AntennaAltitudeAboveBelowMeanSeaLevel~%#10. Units of antenna altitude, meters~%string gga10UnitsOfAntennaAltitude_inMeters~%#11. Geoidal separation, the difference between the WGS-84 earth~%string gga11GeoidalSeparation~%#     ellipsoid and mean-sea-level (geoid), \"-\" means mean-sea-level~%#     below ellipsoid~%#12. Units of geoidal separation, meters~%string gga12UnitsOfGeoidalSeperation~%#13. Age of differential GPS data, time in seconds since last SC104~%string gga13AgeOfDifferentialGPSData~%#     type 1 or 9 update, null field when DGPS is not used~%#14. Differential reference station ID, 0000-1023~%string gga14DifferentialReferenceStationID~%#15. Checksum~%~%###############################################################################~%# $--GSA,a,a,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x.x,x.x,x.x*hh<CR><LF>~%#------------------------------------------------------------------------------~%#~%#Field Number:~%#~%#1. Selection mode: M=Manual, forced to operate in 2D or 3D, A=Automatic, 3D/2D~%string gsa1SelectionMode~%#2. Mode (1 = no fix, 2 = 2D fix, 3 = 3D fix)~%string gsa2Mode~%#3. ID of 1st satellite used for fix~%string gsa3ID1~%#4. ID of 2nd satellite used for fix~%string gsa4ID2~%#5. ID of 4rd satellite used for fix~%string gsa5ID3~%#6. ID of 4th satellite used for fix~%string gsa6ID4~%#7. ID of 5th satellite used for fix~%string gsa7ID5~%#8. ID of 6th satellite used for fix~%string gsa8ID6~%#9. ID of 7th satellite used for fix~%string gsa9ID7~%#10. ID of 8th satellite used for fix~%string gsa10ID8~%#11. ID of 9th satellite used for fix~%string gsa11ID9~%#12. ID of 10th satellite used for fix~%string gsa12ID10~%#13. ID of 11th satellite used for fix~%string gsa13ID11~%#14. ID of 12th satellite used for fix~%string gsa14ID12~%#15. PDOP~%string gsa15PDOP~%#16. HDOP~%string gsa16HDOP~%#17. VDOP~%string gsa17VDOP~%#18. Checksum~%#~%#~%#=== GSV - Satellites in view ===~%#~%#These sentences describe the sky position of a UPS satellite in view.~%#Typically they're shipped in a group of 2 or 3.~%#~%#------------------------------------------------------------------------------~%#        1 2 3 4 5 6 7     n~%#        | | | | | | |     |~%# $--GSV,x,x,x,x,x,x,x,...*hh<CR><LF>~%#------------------------------------------------------------------------------#~%#~%#Field Number:~%#~%int8 gsvAdet~%#1. total number of GSV messages to be transmitted in this group~%string gsv1NumberOfGSV~%#2. 1-origin number of this GSV message  within current group~%string gsv2NumberOfMessage~%#3. total number of satellites in view (leading zeros sent)~%string gsv3NumberOfStallitesInView~%#4. satellite PRN number (leading zeros sent)~%string gsv4SatellitePRNNumber~%#5. elevation in degrees (00-90) (leading zeros sent)~%string gsv5ElevationDegrees~%#6. azimuth in degrees to true north (000-359) (leading zeros sent)~%string gsv6AzimuthIndegries~%#7. SNR in dB (00-99) (leading zeros sent)~%string gsv7SRNin_dB~%#   more satellite info quadruples like 4-7~%string gsv8MoreSatelliteInfoQuadruples~%#   n) checksum~%#~%#Example:~%#    $GPGSV,3,1,11,03,03,111,00,04,15,270,00,06,01,010,00,13,06,292,00*74~%#    $GPGSV,3,2,11,14,25,170,00,16,57,208,39,18,67,296,40,19,40,246,00*74~%#    $GPGSV,3,3,11,22,42,067,42,24,14,311,43,27,05,244,00,,,,*4D~%#~%#Some GPS receivers may emit more than 12 quadruples (more than three~%#GPGSV sentences), even though NMEA-0813 doesn't allow this.  (The~%#extras might be WAAS satellites, for example.) Receivers may also~%#report quads for satellites they aren't tracking, in which case the~%#SNR field will be null; we don't know whether this is formally allowed~%#or not.~%#~%#~%#~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: gps_node/GPSStatus~%Header header~%~%# Satellites used in solution~%uint16 satellites_used # Number of satellites~%int32[] satellite_used_prn # PRN identifiers~%~%# Satellites visible~%uint16 satellites_visible~%int32[] satellite_visible_prn # PRN identifiers~%int32[] satellite_visible_z # Elevation of satellites~%int32[] satellite_visible_azimuth # Azimuth of satellites~%int32[] satellite_visible_snr # Signal-to-noise ratios (dB)~%~%# Measurement status~%int16 STATUS_NO_FIX=-1   # Unable to fix position~%int16 STATUS_FIX=0       # Normal fix~%int16 STATUS_SBAS_FIX=1  # Fixed using a satellite-based augmentation system~%int16 STATUS_GBAS_FIX=2  #          or a ground-based augmentation system~%int16 STATUS_DGPS_FIX=18 # Fixed with DGPS~%int16 STATUS_WAAS_FIX=33 # Fixed with WAAS~%int16 status~%~%uint16 SOURCE_NONE=0 # No information is available~%uint16 SOURCE_GPS=1 # Using standard GPS location [only valid for position_source]~%uint16 SOURCE_POINTS=2 # Motion/orientation fix is derived from successive points~%uint16 SOURCE_DOPPLER=4 # Motion is derived using the Doppler effect~%uint16 SOURCE_ALTIMETER=8 # Using an altimeter~%uint16 SOURCE_MAGNETIC=16 # Using magnetic sensors~%uint16 SOURCE_GYRO=32 # Using gyroscopes~%uint16 SOURCE_ACCEL=64 # Using accelerometers~%~%uint16 motion_source # Source for speed, climb and track~%uint16 orientation_source # Source for device orientation~%uint16 position_source # Source for position~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GPSFix)))
  "Returns full string definition for message of type 'GPSFix"
  (cl:format cl:nil "# A more complete GPS fix to supplement sensor_msgs/NavSatFix.~%Header header~%~%GPSStatus status~%~%# Latitude (degrees). Positive is north of equator; negative is south.~%float64 latitude~%~%# Longitude (degrees). Positive is east of prime meridian, negative west.~%float64 longitude~%~%# Altitude (meters). Positive is above reference (e.g., sea level).~%float64 altitude~%~%# Direction (degrees from north)~%float64 track~%~%# Ground speed (meters/second)~%float64 speed~%~%# Vertical speed (meters/second)~%float64 climb~%~%# Device orientation (units in degrees)~%float64 pitch~%float64 roll~%float64 dip~%~%# GPS time~%float64 time~%~%## Dilution of precision; Xdop<=0 means the value is unknown~%~%# Total (positional-temporal) dilution of precision~%float64 gdop~%~%# Positional (3D) dilution of precision~%float64 pdop~%~%# Horizontal dilution of precision~%float64 hdop~%~%# Vertical dilution of precision~%float64 vdop~%~%# Temporal dilution of precision~%float64 tdop~%~%## Uncertainty of measurement, 95% confidence~%~%# Spherical position uncertainty (meters) [epe]~%float64 err~%~%# Horizontal position uncertainty (meters) [eph]~%float64 err_horz~%~%# Vertical position uncertainty (meters) [epv]~%float64 err_vert~%~%# Track uncertainty (degrees) [epd]~%float64 err_track~%~%# Ground speed uncertainty (meters/second) [eps]~%float64 err_speed~%~%# Vertical speed uncertainty (meters/second) [epc]~%float64 err_climb~%~%# Temporal uncertainty [ept]~%float64 err_time~%~%# Orientation uncertainty (degrees)~%float64 err_pitch~%float64 err_roll~%float64 err_dip~%~%# Position covariance [m^2] defined relative to a tangential plane~%# through the reported position. The components are East, North, and~%# Up (ENU), in row-major order.~%~%float64[9] position_covariance~%~%uint8 COVARIANCE_TYPE_UNKNOWN = 0~%uint8 COVARIANCE_TYPE_APPROXIMATED = 1~%uint8 COVARIANCE_TYPE_DIAGONAL_KNOWN = 2~%uint8 COVARIANCE_TYPE_KNOWN = 3~%~%uint8 position_covariance_type~%~%string lastRawData~%###############################################################################~%#=== RMC - Recommended Minimum Navigation Information ===~%#~%#------------------------------------------------------------------------------~%#                                                          12~%#        1         2 3       4 5        6  7   8   9    10 11|  13~%#        |         | |       | |        |  |   |   |    |  | |   |~%# $--RMC,hhmmss.ss,A,llll.ll,a,yyyyy.yy,a,x.x,x.x,xxxx,x.x,a,m,*hh<CR><LF>~%#------------------------------------------------------------------------------#~%#~%#Field Number:~%#~%#1. UTC Time~%string rmc1UTCTime~%#2. Status, V=Navigation receiver warning A=Valid~%string rmc2STatus~%#3. Latitude~%string rmc3Latitude~%#4. N or S~%string rmc4LatNorS~%#5. Longitude~%string rmc5Longitude~%#6. E or W~%string rmc6LongEorW~%#7. Speed over ground, knots~%string rmc7SpeedOverGroundInKnots~%#8. Track made good, degrees true~%string rmc8TrackMadeGoodDegreeTrue~%#9. Date, ddmmyy~%string rmc9Date~%#10. Magnetic Variation, degrees~%string rmc10MagneticVariationDegrees~%#11. E or W~%string rmc11MagnetEorW~%#12. FAA mode indicator (NMEA 2.3 and later)~%string rmc12FAAModeIndicator~%#13. Checksum~%###############################################################################~%#                                                      11~%#        1         2       3 4        5 6 7  8   9  10 |  12 13  14   15~%#        |         |       | |        | | |  |   |   | |   | |   |    |~%# $--GGA,hhmmss.ss,llll.ll,a,yyyyy.yy,a,x,xx,x.x,x.x,M,x.x,M,x.x,xxxx*hh<CR><LF>~%#------------------------------------------------------------------------------~%#~%#Field Number:~%#1. Universal Time Coordinated (UTC)~%string gga1UTC~%#2. Latitude~%string gga2Latitude~%#3. N or S (North or South)~%string gga3LatNorS~%#4. Longitude~%string gga4Longitude~%#5. E or W (East or West)~%string gga5LongEorW~%#6. GPS Quality Indicator,~%string gga6GPSQuality~%string gga6GPSQualityStatus~%#     - 0 - fix not available,~%#     - 1 - GPS fix,~%#     - 2 - Differential GPS fix~%#           (values above 2 are 2.3 features)~%#     - 3 = PPS fix~%#     - 4 = Real Time Kinematic~%#     - 5 = Float RTK~%#     - 6 = estimated (dead reckoning)~%#     - 7 = Manual input mode~%#     - 8 = Simulation mode~%#7. Number of satellites in view, 00 - 12~%string gga7NumberOfSatellites~%#8. Horizontal Dilution of precision (meters)~%string gga8HorizontalDilutionOfPrescision~%#9. Antenna Altitude above/below mean-sea-level (geoid) (in meters)~%string gga9AntennaAltitudeAboveBelowMeanSeaLevel~%#10. Units of antenna altitude, meters~%string gga10UnitsOfAntennaAltitude_inMeters~%#11. Geoidal separation, the difference between the WGS-84 earth~%string gga11GeoidalSeparation~%#     ellipsoid and mean-sea-level (geoid), \"-\" means mean-sea-level~%#     below ellipsoid~%#12. Units of geoidal separation, meters~%string gga12UnitsOfGeoidalSeperation~%#13. Age of differential GPS data, time in seconds since last SC104~%string gga13AgeOfDifferentialGPSData~%#     type 1 or 9 update, null field when DGPS is not used~%#14. Differential reference station ID, 0000-1023~%string gga14DifferentialReferenceStationID~%#15. Checksum~%~%###############################################################################~%# $--GSA,a,a,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x.x,x.x,x.x*hh<CR><LF>~%#------------------------------------------------------------------------------~%#~%#Field Number:~%#~%#1. Selection mode: M=Manual, forced to operate in 2D or 3D, A=Automatic, 3D/2D~%string gsa1SelectionMode~%#2. Mode (1 = no fix, 2 = 2D fix, 3 = 3D fix)~%string gsa2Mode~%#3. ID of 1st satellite used for fix~%string gsa3ID1~%#4. ID of 2nd satellite used for fix~%string gsa4ID2~%#5. ID of 4rd satellite used for fix~%string gsa5ID3~%#6. ID of 4th satellite used for fix~%string gsa6ID4~%#7. ID of 5th satellite used for fix~%string gsa7ID5~%#8. ID of 6th satellite used for fix~%string gsa8ID6~%#9. ID of 7th satellite used for fix~%string gsa9ID7~%#10. ID of 8th satellite used for fix~%string gsa10ID8~%#11. ID of 9th satellite used for fix~%string gsa11ID9~%#12. ID of 10th satellite used for fix~%string gsa12ID10~%#13. ID of 11th satellite used for fix~%string gsa13ID11~%#14. ID of 12th satellite used for fix~%string gsa14ID12~%#15. PDOP~%string gsa15PDOP~%#16. HDOP~%string gsa16HDOP~%#17. VDOP~%string gsa17VDOP~%#18. Checksum~%#~%#~%#=== GSV - Satellites in view ===~%#~%#These sentences describe the sky position of a UPS satellite in view.~%#Typically they're shipped in a group of 2 or 3.~%#~%#------------------------------------------------------------------------------~%#        1 2 3 4 5 6 7     n~%#        | | | | | | |     |~%# $--GSV,x,x,x,x,x,x,x,...*hh<CR><LF>~%#------------------------------------------------------------------------------#~%#~%#Field Number:~%#~%int8 gsvAdet~%#1. total number of GSV messages to be transmitted in this group~%string gsv1NumberOfGSV~%#2. 1-origin number of this GSV message  within current group~%string gsv2NumberOfMessage~%#3. total number of satellites in view (leading zeros sent)~%string gsv3NumberOfStallitesInView~%#4. satellite PRN number (leading zeros sent)~%string gsv4SatellitePRNNumber~%#5. elevation in degrees (00-90) (leading zeros sent)~%string gsv5ElevationDegrees~%#6. azimuth in degrees to true north (000-359) (leading zeros sent)~%string gsv6AzimuthIndegries~%#7. SNR in dB (00-99) (leading zeros sent)~%string gsv7SRNin_dB~%#   more satellite info quadruples like 4-7~%string gsv8MoreSatelliteInfoQuadruples~%#   n) checksum~%#~%#Example:~%#    $GPGSV,3,1,11,03,03,111,00,04,15,270,00,06,01,010,00,13,06,292,00*74~%#    $GPGSV,3,2,11,14,25,170,00,16,57,208,39,18,67,296,40,19,40,246,00*74~%#    $GPGSV,3,3,11,22,42,067,42,24,14,311,43,27,05,244,00,,,,*4D~%#~%#Some GPS receivers may emit more than 12 quadruples (more than three~%#GPGSV sentences), even though NMEA-0813 doesn't allow this.  (The~%#extras might be WAAS satellites, for example.) Receivers may also~%#report quads for satellites they aren't tracking, in which case the~%#SNR field will be null; we don't know whether this is formally allowed~%#or not.~%#~%#~%#~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: gps_node/GPSStatus~%Header header~%~%# Satellites used in solution~%uint16 satellites_used # Number of satellites~%int32[] satellite_used_prn # PRN identifiers~%~%# Satellites visible~%uint16 satellites_visible~%int32[] satellite_visible_prn # PRN identifiers~%int32[] satellite_visible_z # Elevation of satellites~%int32[] satellite_visible_azimuth # Azimuth of satellites~%int32[] satellite_visible_snr # Signal-to-noise ratios (dB)~%~%# Measurement status~%int16 STATUS_NO_FIX=-1   # Unable to fix position~%int16 STATUS_FIX=0       # Normal fix~%int16 STATUS_SBAS_FIX=1  # Fixed using a satellite-based augmentation system~%int16 STATUS_GBAS_FIX=2  #          or a ground-based augmentation system~%int16 STATUS_DGPS_FIX=18 # Fixed with DGPS~%int16 STATUS_WAAS_FIX=33 # Fixed with WAAS~%int16 status~%~%uint16 SOURCE_NONE=0 # No information is available~%uint16 SOURCE_GPS=1 # Using standard GPS location [only valid for position_source]~%uint16 SOURCE_POINTS=2 # Motion/orientation fix is derived from successive points~%uint16 SOURCE_DOPPLER=4 # Motion is derived using the Doppler effect~%uint16 SOURCE_ALTIMETER=8 # Using an altimeter~%uint16 SOURCE_MAGNETIC=16 # Using magnetic sensors~%uint16 SOURCE_GYRO=32 # Using gyroscopes~%uint16 SOURCE_ACCEL=64 # Using accelerometers~%~%uint16 motion_source # Source for speed, climb and track~%uint16 orientation_source # Source for device orientation~%uint16 position_source # Source for position~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GPSFix>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'status))
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'position_covariance) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     1
     4 (cl:length (cl:slot-value msg 'lastRawData))
     4 (cl:length (cl:slot-value msg 'rmc1UTCTime))
     4 (cl:length (cl:slot-value msg 'rmc2STatus))
     4 (cl:length (cl:slot-value msg 'rmc3Latitude))
     4 (cl:length (cl:slot-value msg 'rmc4LatNorS))
     4 (cl:length (cl:slot-value msg 'rmc5Longitude))
     4 (cl:length (cl:slot-value msg 'rmc6LongEorW))
     4 (cl:length (cl:slot-value msg 'rmc7SpeedOverGroundInKnots))
     4 (cl:length (cl:slot-value msg 'rmc8TrackMadeGoodDegreeTrue))
     4 (cl:length (cl:slot-value msg 'rmc9Date))
     4 (cl:length (cl:slot-value msg 'rmc10MagneticVariationDegrees))
     4 (cl:length (cl:slot-value msg 'rmc11MagnetEorW))
     4 (cl:length (cl:slot-value msg 'rmc12FAAModeIndicator))
     4 (cl:length (cl:slot-value msg 'gga1UTC))
     4 (cl:length (cl:slot-value msg 'gga2Latitude))
     4 (cl:length (cl:slot-value msg 'gga3LatNorS))
     4 (cl:length (cl:slot-value msg 'gga4Longitude))
     4 (cl:length (cl:slot-value msg 'gga5LongEorW))
     4 (cl:length (cl:slot-value msg 'gga6GPSQuality))
     4 (cl:length (cl:slot-value msg 'gga6GPSQualityStatus))
     4 (cl:length (cl:slot-value msg 'gga7NumberOfSatellites))
     4 (cl:length (cl:slot-value msg 'gga8HorizontalDilutionOfPrescision))
     4 (cl:length (cl:slot-value msg 'gga9AntennaAltitudeAboveBelowMeanSeaLevel))
     4 (cl:length (cl:slot-value msg 'gga10UnitsOfAntennaAltitude_inMeters))
     4 (cl:length (cl:slot-value msg 'gga11GeoidalSeparation))
     4 (cl:length (cl:slot-value msg 'gga12UnitsOfGeoidalSeperation))
     4 (cl:length (cl:slot-value msg 'gga13AgeOfDifferentialGPSData))
     4 (cl:length (cl:slot-value msg 'gga14DifferentialReferenceStationID))
     4 (cl:length (cl:slot-value msg 'gsa1SelectionMode))
     4 (cl:length (cl:slot-value msg 'gsa2Mode))
     4 (cl:length (cl:slot-value msg 'gsa3ID1))
     4 (cl:length (cl:slot-value msg 'gsa4ID2))
     4 (cl:length (cl:slot-value msg 'gsa5ID3))
     4 (cl:length (cl:slot-value msg 'gsa6ID4))
     4 (cl:length (cl:slot-value msg 'gsa7ID5))
     4 (cl:length (cl:slot-value msg 'gsa8ID6))
     4 (cl:length (cl:slot-value msg 'gsa9ID7))
     4 (cl:length (cl:slot-value msg 'gsa10ID8))
     4 (cl:length (cl:slot-value msg 'gsa11ID9))
     4 (cl:length (cl:slot-value msg 'gsa12ID10))
     4 (cl:length (cl:slot-value msg 'gsa13ID11))
     4 (cl:length (cl:slot-value msg 'gsa14ID12))
     4 (cl:length (cl:slot-value msg 'gsa15PDOP))
     4 (cl:length (cl:slot-value msg 'gsa16HDOP))
     4 (cl:length (cl:slot-value msg 'gsa17VDOP))
     1
     4 (cl:length (cl:slot-value msg 'gsv1NumberOfGSV))
     4 (cl:length (cl:slot-value msg 'gsv2NumberOfMessage))
     4 (cl:length (cl:slot-value msg 'gsv3NumberOfStallitesInView))
     4 (cl:length (cl:slot-value msg 'gsv4SatellitePRNNumber))
     4 (cl:length (cl:slot-value msg 'gsv5ElevationDegrees))
     4 (cl:length (cl:slot-value msg 'gsv6AzimuthIndegries))
     4 (cl:length (cl:slot-value msg 'gsv7SRNin_dB))
     4 (cl:length (cl:slot-value msg 'gsv8MoreSatelliteInfoQuadruples))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GPSFix>))
  "Converts a ROS message object to a list"
  (cl:list 'GPSFix
    (cl:cons ':header (header msg))
    (cl:cons ':status (status msg))
    (cl:cons ':latitude (latitude msg))
    (cl:cons ':longitude (longitude msg))
    (cl:cons ':altitude (altitude msg))
    (cl:cons ':track (track msg))
    (cl:cons ':speed (speed msg))
    (cl:cons ':climb (climb msg))
    (cl:cons ':pitch (pitch msg))
    (cl:cons ':roll (roll msg))
    (cl:cons ':dip (dip msg))
    (cl:cons ':time (time msg))
    (cl:cons ':gdop (gdop msg))
    (cl:cons ':pdop (pdop msg))
    (cl:cons ':hdop (hdop msg))
    (cl:cons ':vdop (vdop msg))
    (cl:cons ':tdop (tdop msg))
    (cl:cons ':err (err msg))
    (cl:cons ':err_horz (err_horz msg))
    (cl:cons ':err_vert (err_vert msg))
    (cl:cons ':err_track (err_track msg))
    (cl:cons ':err_speed (err_speed msg))
    (cl:cons ':err_climb (err_climb msg))
    (cl:cons ':err_time (err_time msg))
    (cl:cons ':err_pitch (err_pitch msg))
    (cl:cons ':err_roll (err_roll msg))
    (cl:cons ':err_dip (err_dip msg))
    (cl:cons ':position_covariance (position_covariance msg))
    (cl:cons ':position_covariance_type (position_covariance_type msg))
    (cl:cons ':lastRawData (lastRawData msg))
    (cl:cons ':rmc1UTCTime (rmc1UTCTime msg))
    (cl:cons ':rmc2STatus (rmc2STatus msg))
    (cl:cons ':rmc3Latitude (rmc3Latitude msg))
    (cl:cons ':rmc4LatNorS (rmc4LatNorS msg))
    (cl:cons ':rmc5Longitude (rmc5Longitude msg))
    (cl:cons ':rmc6LongEorW (rmc6LongEorW msg))
    (cl:cons ':rmc7SpeedOverGroundInKnots (rmc7SpeedOverGroundInKnots msg))
    (cl:cons ':rmc8TrackMadeGoodDegreeTrue (rmc8TrackMadeGoodDegreeTrue msg))
    (cl:cons ':rmc9Date (rmc9Date msg))
    (cl:cons ':rmc10MagneticVariationDegrees (rmc10MagneticVariationDegrees msg))
    (cl:cons ':rmc11MagnetEorW (rmc11MagnetEorW msg))
    (cl:cons ':rmc12FAAModeIndicator (rmc12FAAModeIndicator msg))
    (cl:cons ':gga1UTC (gga1UTC msg))
    (cl:cons ':gga2Latitude (gga2Latitude msg))
    (cl:cons ':gga3LatNorS (gga3LatNorS msg))
    (cl:cons ':gga4Longitude (gga4Longitude msg))
    (cl:cons ':gga5LongEorW (gga5LongEorW msg))
    (cl:cons ':gga6GPSQuality (gga6GPSQuality msg))
    (cl:cons ':gga6GPSQualityStatus (gga6GPSQualityStatus msg))
    (cl:cons ':gga7NumberOfSatellites (gga7NumberOfSatellites msg))
    (cl:cons ':gga8HorizontalDilutionOfPrescision (gga8HorizontalDilutionOfPrescision msg))
    (cl:cons ':gga9AntennaAltitudeAboveBelowMeanSeaLevel (gga9AntennaAltitudeAboveBelowMeanSeaLevel msg))
    (cl:cons ':gga10UnitsOfAntennaAltitude_inMeters (gga10UnitsOfAntennaAltitude_inMeters msg))
    (cl:cons ':gga11GeoidalSeparation (gga11GeoidalSeparation msg))
    (cl:cons ':gga12UnitsOfGeoidalSeperation (gga12UnitsOfGeoidalSeperation msg))
    (cl:cons ':gga13AgeOfDifferentialGPSData (gga13AgeOfDifferentialGPSData msg))
    (cl:cons ':gga14DifferentialReferenceStationID (gga14DifferentialReferenceStationID msg))
    (cl:cons ':gsa1SelectionMode (gsa1SelectionMode msg))
    (cl:cons ':gsa2Mode (gsa2Mode msg))
    (cl:cons ':gsa3ID1 (gsa3ID1 msg))
    (cl:cons ':gsa4ID2 (gsa4ID2 msg))
    (cl:cons ':gsa5ID3 (gsa5ID3 msg))
    (cl:cons ':gsa6ID4 (gsa6ID4 msg))
    (cl:cons ':gsa7ID5 (gsa7ID5 msg))
    (cl:cons ':gsa8ID6 (gsa8ID6 msg))
    (cl:cons ':gsa9ID7 (gsa9ID7 msg))
    (cl:cons ':gsa10ID8 (gsa10ID8 msg))
    (cl:cons ':gsa11ID9 (gsa11ID9 msg))
    (cl:cons ':gsa12ID10 (gsa12ID10 msg))
    (cl:cons ':gsa13ID11 (gsa13ID11 msg))
    (cl:cons ':gsa14ID12 (gsa14ID12 msg))
    (cl:cons ':gsa15PDOP (gsa15PDOP msg))
    (cl:cons ':gsa16HDOP (gsa16HDOP msg))
    (cl:cons ':gsa17VDOP (gsa17VDOP msg))
    (cl:cons ':gsvAdet (gsvAdet msg))
    (cl:cons ':gsv1NumberOfGSV (gsv1NumberOfGSV msg))
    (cl:cons ':gsv2NumberOfMessage (gsv2NumberOfMessage msg))
    (cl:cons ':gsv3NumberOfStallitesInView (gsv3NumberOfStallitesInView msg))
    (cl:cons ':gsv4SatellitePRNNumber (gsv4SatellitePRNNumber msg))
    (cl:cons ':gsv5ElevationDegrees (gsv5ElevationDegrees msg))
    (cl:cons ':gsv6AzimuthIndegries (gsv6AzimuthIndegries msg))
    (cl:cons ':gsv7SRNin_dB (gsv7SRNin_dB msg))
    (cl:cons ':gsv8MoreSatelliteInfoQuadruples (gsv8MoreSatelliteInfoQuadruples msg))
))
