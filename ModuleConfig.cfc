/**
 * Copyright Since 2005 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
 * www.ortussolutions.com
 * ---
 */
component {

	// Information used by ColdBox to register this module.
	this.title 				= "schema-org";
	this.author 			= "Angry Sam Productions, Inc.";
	this.webURL 			= "https://www.angrysam.com";
	this.description 		= "A ColdBox module for schema.org structured data";
	this.version 			= "@build.version@+@build.number@";

	// Models can be requested with names such as SchemaBuilder@schema-org.
	this.modelNamespace		= "schema-org";

	// Map the schema-org prefix to this module's folder.
	this.cfmapping			= "schema-org";

	// This module does not require other ColdBox modules.
	this.dependencies 		= [];

	/**
	 * Defines module settings before ColdBox registers the module.
	 */
	function configure(){
		settings = {

		};
	}

	/**
	 * Runs after ColdBox registers and activates the module.
	 */
	function onLoad(){

	}

	/**
	 * Runs after ColdBox unregisters and unloads the module.
	 */
	function onUnload(){

	}

}
