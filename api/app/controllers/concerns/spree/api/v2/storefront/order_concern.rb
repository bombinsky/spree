module Spree
  module Api
    module V2
      module Storefront
        module OrderConcern
          private

          def render_order(result)
            if result.success?
              render_serialized_payload { serialized_current_order }
            else
              render_error_payload(result.error)
            end
          end

          def ensure_order
            raise ActiveRecord::RecordNotFound if spree_current_order.nil?
          end

          def order_token
            request.headers['X-Spree-Order-Token'] || params[:order_token]
          end

          def spree_current_order
            @spree_current_order ||= find_spree_current_order
          end

          def find_spree_current_order
            Spree::Api::Dependencies.storefront_current_order_finder.constantize.new.execute(
              store: spree_current_store,
              user: spree_current_user,
              token: order_token,
              currency: use_current_currency
            )
          end

          def use_current_currency
            if session.key?(:currency) && supported_currencies.map(&:iso_code).include?(session[:currency])
              session[:currency]
            else
<<<<<<< HEAD
              spree_current_store.default_currency || Spree::Config[:currency]
=======
              Spree::Config[:currency]
>>>>>>> 4eadff5c14... Adds spree_multi_currency logic to spree 4.0
            end
          end

          def supported_currencies
            Spree::Config[:supported_currencies].split(',').map do |code|
              ::Money::Currency.find(code.strip)
            end
          end

          def serialize_order(order)
            resource_serializer.new(order.reload, include: resource_includes, fields: sparse_fields).serializable_hash
          end

          def serialized_current_order
            serialize_order(spree_current_order)
          end
        end
      end
    end
  end
end
