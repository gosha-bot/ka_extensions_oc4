<?php
/*
	Builds ka_extensions.ocmod.zip like pack_ka_extensions.bat does: the contents of
	extension/ka_extensions without active.kamod.

	Usage: php tests/build-package.php <output zip>
*/
if (empty($argv[1])) {
	fwrite(STDERR, "Usage: php tests/build-package.php <output zip>\n");
	exit(1);
}
$src = dirname(__DIR__) . '/extension/ka_extensions';
$out = $argv[1];
@unlink($out);

$zip = new ZipArchive();
if ($zip->open($out, ZipArchive::CREATE) !== true) {
	fwrite(STDERR, "Cannot create $out\n");
	exit(1);
}
$it = new RecursiveIteratorIterator(new RecursiveDirectoryIterator($src, FilesystemIterator::SKIP_DOTS));
foreach ($it as $file) {
	$name = str_replace('\\', '/', substr($file->getPathname(), strlen($src) + 1));
	if ($name == 'active.kamod' || strpos($name, '.svn/') !== false) {
		continue;
	}
	$zip->addFile($file->getPathname(), $name);
}
$zip->close();
echo "Package: $out\n";
