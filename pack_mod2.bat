del /Q mod2*.ocmod.zip
del extension\mod2\active.kamod

rmdir /S /Q tmp_pack
mkdir tmp_pack
xcopy /E /I extension\mod2\* tmp_pack\*

cd tmp_pack
zip -r ..\mod2.ocmod.zip *