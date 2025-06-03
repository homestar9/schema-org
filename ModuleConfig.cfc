/**
 * Copyright Since 2005 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
 * www.ortussolutions.com
 * ---
 */
component {

	// Module Properties
	this.title 				= "schema-org";
	this.author 			= "Angry Sam Productions, Inc.";
	this.webURL 			= "https://www.angrysam.com";
	this.description 		= "@MODULE_DESCRIPTION@";
	this.version 			= "@build.version@+@build.number@";

	// Model Namespace
	this.modelNamespace		= "schema-org";

	// CF Mapping
	this.cfmapping			= "schema-org";

	// Dependencies
	this.dependencies 		= [];

	/**
	 * Configure Module
	 */
	function configure(){
		settings = {

		};
	}

	/**
	 * Fired when the module is registered and activated.
	 */
	function onLoad(){

	}

	/**
	 * Fired when the module is unregistered and unloaded
	 */
	function onUnload(){

	}

}
