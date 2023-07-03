[ -z $MODPATH ] && MODPATH=${0%/*}

# destination
MODAEC=`find $MODPATH -type f -name *audio*effects*.conf`
MODAEX=`find $MODPATH -type f -name *audio*effects*.xml`

# function
remove_conf() {
for RMV in $RMVS; do
  sed -i "s|$RMV|removed|g" $MODAEC
done
sed -i 's|path /vendor/lib/soundfx/removed||g' $MODAEC
sed -i 's|path /system/lib/soundfx/removed||g' $MODAEC
sed -i 's|path /vendor/lib/removed||g' $MODAEC
sed -i 's|path /system/lib/removed||g' $MODAEC
sed -i 's|library removed||g' $MODAEC
sed -i 's|uuid removed||g' $MODAEC
sed -i "/^        removed {/ {;N s/        removed {\n        }//}" $MODAEC
sed -i 's|removed { }||g' $MODAEC
sed -i 's|removed {}||g' $MODAEC
sed -i '/removed.*{.*/,/}/d' $MODAEC
sed -i -n '/^\s*$/!p' $MODAEC
sed -i '/^[[:space:]]*$/d' $MODAEC
}
remove_xml() {
for RMV in $RMVS; do
  sed -i "s|\"$RMV\"|\"removed\"|g" $MODAEX
done
sed -i 's|<library name="removed" path="removed"/>||g' $MODAEX
sed -i 's|<library name="proxy" path="removed"/>||g' $MODAEX
sed -i 's|<effect name="removed" library="removed" uuid="removed"/>||g' $MODAEX
sed -i 's|<effect name="removed" uuid="removed" library="removed"/>||g' $MODAEX
sed -i 's|<libsw library="removed" uuid="removed"/>||g' $MODAEX
sed -i 's|<libhw library="removed" uuid="removed"/>||g' $MODAEX
sed -i 's|<apply effect="removed"/>||g' $MODAEX
sed -i 's|<library name="removed" path="removed" />||g' $MODAEX
sed -i 's|<library name="proxy" path="removed" />||g' $MODAEX
sed -i 's|<effect name="removed" library="removed" uuid="removed" />||g' $MODAEX
sed -i 's|<effect name="removed" uuid="removed" library="removed" />||g' $MODAEX
sed -i 's|<libsw library="removed" uuid="removed" />||g' $MODAEX
sed -i 's|<libhw library="removed" uuid="removed" />||g' $MODAEX
sed -i 's|<apply effect="removed" />||g' $MODAEX
sed -i '/<effectProxy.*removed.*/,/<\/effectProxy>/d' $MODAEX
sed -i '/removed/d' $MODAEX
sed -i '/^[[:space:]]*$/d' $MODAEX
sed -i -n '/^\s*$/!p' $MODAEX
}

# remove
RMVS="libaudioeffectoffload.so
      libqcompostprocbundle.so
     liboffloadeffect.so
     libbundlewrapper.so
     hw_acc
     downmix
	 libdownmix.so
	 reverb
	 bundle
	 loudness_enhancer
	 offload_bundle
	 dirac_gef
	 libdiraceffect.so
	 volume_listener
	 volume 
	 shoebox
	 audiosphere
	 visualizer_sw
	 visualizer_hw
	 virtualizer
	 bassboost
	 proxy
 	equalizer 
 	reverb_env_ins 
 	reverb_env_aux
 	reverb_pre_ins 
 	reverb_pre_aux
 	libeffectproxy.so
 	libvisualizer.so
 	libcomvisualizer.so
 	d069d9e0-8329-11df-9168-0002a5d5c51b
 	7a8044a0-1a71-11e3-a184-0002a5d5c51b
 	1d0a1a53-7d5d-48f2-8e71-27fbd10d842c
 	7d1580bd-297f-4683-9239-e475b6d1d69f
	 93f04452-e4fe-41cc-91f9-e475b6d1d69f
	 3799D6D1-22C5-43C3-B3EC-D664CF8D2F0D
     14804144-a5ee-4d24-aa88-0002a5d5c51b
     8631f300-72e2-11df-b57e-0002a5d5c51b
     2c4a8c24-1581-487f-94f6-0002a5d5c51b
     d3467faa-acc7-4d34-acaf-0002a5d5c51b
     1d4033c0-8557-11df-9f2d-0002a5d5c51b
     509a4498-561a-4bea-b3b1-0002a5d5c51b
     c8e70ecd-48ca-456e-8a4f-0002a5d5c51b
     ce772f20-847d-11df-bb17-0002a5d5c51b
     a0dac280-401c-11e3-9379-0002a5d5c51b
     119341a0-8469-11df-81f9-0002a5d5c51b
     2f0871a2-c93c-4824-9664-42eb2909f2ef
     c7e3b29d-e797-4cf9-9912-17c1956510cc
     626499c6-647e-455e-8c45-2d106e23c755
     f8f88a03-fdf8-4554-8e60-77fbf8f2d3b0
     49004f03-3391-4c44-97dd-a043d526ea7d
     50deaa30-4a83-4b1f-bfe3-dec6d605ede0
     libreverbwrapper.so
     48404ac9-d202-4ccc-bf84-0002a5d5c51b
     4a387fc0-8ab3-11df-8bad-0002a5d5c51b
     79a18026-18fd-4185-8233-0002a5d5c51b
     b707403a-a1c1-4291-9573-0002a5d5c51b
     c7a511a0-a3bb-11df-860e-0002a5d5c51b
     eb64ea04-973b-43d2-8f5e-0002a5d5c51b
     1b78f587-6d1c-422e-8b84-0002a5d5c51b
     f29a1400-a3bb-11df-8ddc-0002a5d5c51b
     6987be09-b142-4b41-9056-0002a5d5c51b
     f3e178d2-ebcb-408e-8357-0002a5d5c51b
     172cdf00-a3bc-11df-a72f-0002a5d5c51b
     aa2bebf6-47cf-4613-9bca-0002a5d5c51b
     b8154738-a0a1-4fc0-bb79-c845a3197739
     0c84bcd9-bce4-441b-ba9e-51f80897c949
     ba0f19fe-8790-4831-a58b-1f3299dd0bae
     86d1877a-127f-4bdc-9665-c958903ad7b2
     80974a8b-b3be-4c21-8c0b-b392a54e13bc
     4f90220c-9742-4467-a9d7-122f85c01195
     c02d7dce-ca56-4aea-8c83-bbb53e5600e8
     a2cf6b45-360b-49f3-94d7-fdb9837f89e8
     libqcbassboost.so
     23aca180-44bd-11e2-bcfd-0800200c9a66
     libqcvirt.so
     e6c98a16-22a3-11e2-b87b-f23c91aec05e
     libqcreverb.so
     a8c1e5f3-293d-43cd-95ec-d5e26c02e217
     791fff8b-8129-4655-83a4-59bc61034c3a
     53ef1db5-c0c0-445b-b060-e34d20ebb70a
     b08a0e38-22a5-11e2-b87b-f23c91aec05e
      volumemonitor_hw
      052a63b0-f95a-11e9-8f0b-362b9e155667
      libvolumemonitor_energy.so
      volumemonitor
      16311c29-bb53-4415-b7af-ae653e812de8
      libsamsungSoundbooster_plus_legacy.so libsamsungSoundbooster_plus.so
      soundbooster_plus
      50de45f0-5d4c-11e5-a837-0800200c9a66
      libsamsungSoundbooster_tdm_legacy.so
      tdm
      beb1d058-916a-4adf-9cfe-54ee5ba8c4a5
      libaudiosaplus_sec_legacy.so libaudiosaplus_sec.so
      soundalive_sec soundalive
      cf65eb39-ce2f-48a8-a903-ceb818c06745
      05227ea0-50bb-11e3-ac69-0002a5d5c51b
      0b2dbc60-50bb-11e3-988b-0002a5d5c51b
      libmysound_legacy.so libmysound.so
      mysound dha
      263a88e0-50b1-11e2-bcfd-0800200c9a66
      37155c20-50bb-11e3-9fac-0002a5d5c51b
      3ef69260-50bb-11e3-931e-0002a5d5c51b
      libmyspace.so
      myspace sa3d
      3462a6e0-655a-11e4-8b67-0002a5d5c51b
      1c91fca0-664a-11e4-b8c2-0002a5d5c51b
      c7a84e61-eebe-4fcc-bc53-efcb841b4625
      libswspatializer.so
      spatializer
      ccd4cf09-a79d-46c2-9aae-06a1698d6c8f
      libLifevibes_lvverx.so
      lmfv fens
      3b75f00-93ce-11e0-9fb8-0002a5d5c51b
      d6dbf400-93ce-11e0-bcd7-0002a5d5c51b
      df0afc20-93ce-11e0-98de-0002a5d5c51b
      989d9460-413d-11e1-8b0d-0002a5d5c51b
      cbcc5980-476d-11e1-82ee-0002a5d5c51b
      libgearvr.so
      vr360audio vr3d
      e6388202-e7a4-4c72-b68a-332eeeba269b
      libswdap_legacy.so
      libswdht_legacy.so
      dlb_ht dht
      b247dfc9-2832-4486-92c0-2db27a3785f5
      libvoicechanger.so
      voicechanger
      25c30101-9542-451f-a064-c3198e187dfc"
if [ "$MODAEC" ]; then
  remove_conf
fi
if [ "$MODAEX" ]; then
  remove_xml
fi
