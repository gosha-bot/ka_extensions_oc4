<?php
/*
	$Project$
	$Author$

	$Version$ ($Revision$)
*/

namespace Opencart\Extension\KaExtensions\System;

/**
	Helpful functions for managing arrays.

	@package Service
*/
class Arrays {
	/**
	 Inserts an array into another array right after the specified key.

	 $array — source array.
	 $key — key after which the values are inserted.
	 $value — array of elements to insert.

	 @return array New array; the source array unchanged if the key is not found.
	*/
	static function insertAfterKey($array, $key, $value) {
	    $key_pos = array_search($key, array_keys($array));
	    if($key_pos !== false){
	        $key_pos++;
	        $second_array = array_splice($array, $key_pos);
	        $array = array_merge($array, $value, $second_array);
	    }
	    return $array;
	}

	/**
	 Inserts an array into another array right before the specified key.

	 $array — source array.
	 $key — key before which the values are inserted.
	 $value — array of elements to insert.

	 @return array New array; the source array unchanged if the key is not found.
	*/
	static function insertBeforeKey($array, $key, $value) {
	    $key_pos = array_search($key, array_keys($array));
	    if($key_pos !== false){
	        $second_array = array_splice($array, $key_pos);
	        $array = array_merge($array, $value, $second_array);
	    }
	    return $array;
	}
}