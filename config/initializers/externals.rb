Kms::ExternalsRegistry.register(:cart) {|request, controller| controller.helpers.current_cart.to_drop }
