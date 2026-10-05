del /Q mod1*.ocmod.zip
del extension\mod1\active.kamod

rmdir /S /Q tmp_pack
mkdir tmp_pack
xcopy /E /I extension\mod1\* tmp_pack\*

cd tmp_pack
zip -r ..\mod1.ocmod.zip *