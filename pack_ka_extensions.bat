del /Q ka_extensions*.ocmod.zip
del tmp_pack\active.kamod

rmdir /S /Q tmp_pack
mkdir tmp_pack
xcopy /E /I extension\ka_extensions\* tmp_pack\*
del tmp_pack\active.kamod

@rem mkdir tmp_pack\system\storage\vendor\karapuz
@rem xcopy /E /I system\storage1\vendor\karapuz tmp_pack\system\storage\vendor\karapuz

cd tmp_pack
zip -r ..\ka_extensions.ocmod.zip *