# A more complete GPS fix to supplement sensor_msgs/NavSatFix.
Header header

GPSStatus status

# Latitude (degrees). Positive is north of equator; negative is south.
float64 latitude

# Longitude (degrees). Positive is east of prime meridian, negative west.
float64 longitude

# Altitude (meters). Positive is above reference (e.g., sea level).
float64 altitude

# Direction (degrees from north)
float64 track

# Ground speed (meters/second)
float64 speed

# Vertical speed (meters/second)
float64 climb

# Device orientation (units in degrees)
float64 pitch
float64 roll
float64 dip

# GPS time
float64 time

## Dilution of precision; Xdop<=0 means the value is unknown

# Total (positional-temporal) dilution of precision
float64 gdop

# Positional (3D) dilution of precision
float64 pdop

# Horizontal dilution of precision
float64 hdop

# Vertical dilution of precision
float64 vdop

# Temporal dilution of precision
float64 tdop

## Uncertainty of measurement, 95% confidence

# Spherical position uncertainty (meters) [epe]
float64 err

# Horizontal position uncertainty (meters) [eph]
float64 err_horz

# Vertical position uncertainty (meters) [epv]
float64 err_vert

# Track uncertainty (degrees) [epd]
float64 err_track

# Ground speed uncertainty (meters/second) [eps]
float64 err_speed

# Vertical speed uncertainty (meters/second) [epc]
float64 err_climb

# Temporal uncertainty [ept]
float64 err_time

# Orientation uncertainty (degrees)
float64 err_pitch
float64 err_roll
float64 err_dip

# Position covariance [m^2] defined relative to a tangential plane
# through the reported position. The components are East, North, and
# Up (ENU), in row-major order.

float64[9] position_covariance

uint8 COVARIANCE_TYPE_UNKNOWN = 0
uint8 COVARIANCE_TYPE_APPROXIMATED = 1
uint8 COVARIANCE_TYPE_DIAGONAL_KNOWN = 2
uint8 COVARIANCE_TYPE_KNOWN = 3

uint8 position_covariance_type

string lastRawData
###############################################################################
#=== RMC - Recommended Minimum Navigation Information ===
#
#------------------------------------------------------------------------------
#                                                          12
#        1         2 3       4 5        6  7   8   9    10 11|  13
#        |         | |       | |        |  |   |   |    |  | |   |
# $--RMC,hhmmss.ss,A,llll.ll,a,yyyyy.yy,a,x.x,x.x,xxxx,x.x,a,m,*hh<CR><LF>
#------------------------------------------------------------------------------#
#
#Field Number:
#
#1. UTC Time
string rmc1UTCTime
#2. Status, V=Navigation receiver warning A=Valid
string rmc2STatus
#3. Latitude
string rmc3Latitude
#4. N or S
string rmc4LatNorS
#5. Longitude
string rmc5Longitude
#6. E or W
string rmc6LongEorW
#7. Speed over ground, knots
string rmc7SpeedOverGroundInKnots
#8. Track made good, degrees true
string rmc8TrackMadeGoodDegreeTrue
#9. Date, ddmmyy
string rmc9Date
#10. Magnetic Variation, degrees
string rmc10MagneticVariationDegrees
#11. E or W
string rmc11MagnetEorW
#12. FAA mode indicator (NMEA 2.3 and later)
string rmc12FAAModeIndicator
#13. Checksum
###############################################################################
#                                                      11
#        1         2       3 4        5 6 7  8   9  10 |  12 13  14   15
#        |         |       | |        | | |  |   |   | |   | |   |    |
# $--GGA,hhmmss.ss,llll.ll,a,yyyyy.yy,a,x,xx,x.x,x.x,M,x.x,M,x.x,xxxx*hh<CR><LF>
#------------------------------------------------------------------------------
#
#Field Number:
#1. Universal Time Coordinated (UTC)
string gga1UTC
#2. Latitude
string gga2Latitude
#3. N or S (North or South)
string gga3LatNorS
#4. Longitude
string gga4Longitude
#5. E or W (East or West)
string gga5LongEorW
#6. GPS Quality Indicator,
string gga6GPSQuality
string gga6GPSQualityStatus
#     - 0 - fix not available,
#     - 1 - GPS fix,
#     - 2 - Differential GPS fix
#           (values above 2 are 2.3 features)
#     - 3 = PPS fix
#     - 4 = Real Time Kinematic
#     - 5 = Float RTK
#     - 6 = estimated (dead reckoning)
#     - 7 = Manual input mode
#     - 8 = Simulation mode
#7. Number of satellites in view, 00 - 12
string gga7NumberOfSatellites
#8. Horizontal Dilution of precision (meters)
string gga8HorizontalDilutionOfPrescision
#9. Antenna Altitude above/below mean-sea-level (geoid) (in meters)
string gga9AntennaAltitudeAboveBelowMeanSeaLevel
#10. Units of antenna altitude, meters
string gga10UnitsOfAntennaAltitude_inMeters
#11. Geoidal separation, the difference between the WGS-84 earth
string gga11GeoidalSeparation
#     ellipsoid and mean-sea-level (geoid), "-" means mean-sea-level
#     below ellipsoid
#12. Units of geoidal separation, meters
string gga12UnitsOfGeoidalSeperation
#13. Age of differential GPS data, time in seconds since last SC104
string gga13AgeOfDifferentialGPSData
#     type 1 or 9 update, null field when DGPS is not used
#14. Differential reference station ID, 0000-1023
string gga14DifferentialReferenceStationID
#15. Checksum

###############################################################################
# $--GSA,a,a,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x.x,x.x,x.x*hh<CR><LF>
#------------------------------------------------------------------------------
#
#Field Number:
#
#1. Selection mode: M=Manual, forced to operate in 2D or 3D, A=Automatic, 3D/2D
string gsa1SelectionMode
#2. Mode (1 = no fix, 2 = 2D fix, 3 = 3D fix)
string gsa2Mode
#3. ID of 1st satellite used for fix
string gsa3ID1
#4. ID of 2nd satellite used for fix
string gsa4ID2
#5. ID of 4rd satellite used for fix
string gsa5ID3
#6. ID of 4th satellite used for fix
string gsa6ID4
#7. ID of 5th satellite used for fix
string gsa7ID5
#8. ID of 6th satellite used for fix
string gsa8ID6
#9. ID of 7th satellite used for fix
string gsa9ID7
#10. ID of 8th satellite used for fix
string gsa10ID8
#11. ID of 9th satellite used for fix
string gsa11ID9
#12. ID of 10th satellite used for fix
string gsa12ID10
#13. ID of 11th satellite used for fix
string gsa13ID11
#14. ID of 12th satellite used for fix
string gsa14ID12
#15. PDOP
string gsa15PDOP
#16. HDOP
string gsa16HDOP
#17. VDOP
string gsa17VDOP
#18. Checksum
#
#
#=== GSV - Satellites in view ===
#
#These sentences describe the sky position of a UPS satellite in view.
#Typically they're shipped in a group of 2 or 3.
#
#------------------------------------------------------------------------------
#        1 2 3 4 5 6 7     n
#        | | | | | | |     |
# $--GSV,x,x,x,x,x,x,x,...*hh<CR><LF>
#------------------------------------------------------------------------------#
#
#Field Number:
#
int8 gsvAdet
#1. total number of GSV messages to be transmitted in this group
string gsv1NumberOfGSV
#2. 1-origin number of this GSV message  within current group
string gsv2NumberOfMessage
#3. total number of satellites in view (leading zeros sent)
string gsv3NumberOfStallitesInView
#4. satellite PRN number (leading zeros sent)
string gsv4SatellitePRNNumber
#5. elevation in degrees (00-90) (leading zeros sent)
string gsv5ElevationDegrees
#6. azimuth in degrees to true north (000-359) (leading zeros sent)
string gsv6AzimuthIndegries
#7. SNR in dB (00-99) (leading zeros sent)
string gsv7SRNin_dB
#   more satellite info quadruples like 4-7
string gsv8MoreSatelliteInfoQuadruples
#   n) checksum
#
#Example:
#    $GPGSV,3,1,11,03,03,111,00,04,15,270,00,06,01,010,00,13,06,292,00*74
#    $GPGSV,3,2,11,14,25,170,00,16,57,208,39,18,67,296,40,19,40,246,00*74
#    $GPGSV,3,3,11,22,42,067,42,24,14,311,43,27,05,244,00,,,,*4D
#
#Some GPS receivers may emit more than 12 quadruples (more than three
#GPGSV sentences), even though NMEA-0813 doesn't allow this.  (The
#extras might be WAAS satellites, for example.) Receivers may also
#report quads for satellites they aren't tracking, in which case the
#SNR field will be null; we don't know whether this is formally allowed
#or not.
#
#
#