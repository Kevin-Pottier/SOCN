#read_tlf ../TECH/dolphin_rom32k8/dirom32768x8/cadence/dirom32768x8_43.tlf
#set AMS_DIR ../TECH/AMS
#read_tlf $AMS_DIR/buildgates_tlf/c35_3.3V/c35_CORELIB.tlf
#read_tlf $AMS_DIR/buildgates_tlf/c35_3.3V/c35_IOLIB_4M.tlf
#set_global target_technology {c35_CORELIB c35_IOLIB_4M}
#set_operating_condition -library c35_CORELIB TYPICAL   -pvt typ
#set_global pvt_early_path min
#set_global pvt_late_path max

#read_adb ../NTL/top_synth_ams.adb
read_db ../NTL/top_synth_ams.db

#read_symbol $AMS_DIR/buildgates_tlf/c35_3.3V/c35_CORELIB.sym

#read_symbol $AMS_DIR/buildgates_tlf/c35_3.3V/c35_IOLIB_4M.sym
