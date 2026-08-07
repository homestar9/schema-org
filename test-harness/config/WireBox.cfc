component extends="coldbox.system.ioc.config.Binder"{

	/**
	 * Configures dependency injection for the test application.
	 */
	function configure(){

		// Define WireBox settings with its configuration struct.
		wireBox = {
			// Store the WireBox injector in the application scope.
			scopeRegistration = {
				enabled = true,
				scope   = "application", // Other supported scopes are server, cluster, and session.
				key		= "wireBox"
			},

			// No custom dependency-injection namespaces are required.
			customDSL = {
				// namespace = "mapping name"
			},

			// No custom object scopes are required.
			customScopes = {
				// annotationName = "mapping name"
			},

			// Do not scan extra packages for automatic bindings.
			scanLocations = [],

			// Do not stop dependency lookup for any package.
			stopRecursions = [],

			// This injector has no parent injector.
			parentInjector = "",

			// Listener entries would be created in array order. No listeners are registered.
			listeners = [
				// { class="", name="", properties={} }
			]
		};

		// This test application does not need manual bindings.
	}

}
