module Minecraft
    module JSONAPIv2
        class Namespace
            def initialize(parent, namespace, options={})
                @parent = parent
                @namespace = namespace
            end

            def method_missing(method, *args)
                method = [@namespace.gsub(/_/,'.'), method.to_s].join('.')
                opts = {name: method, args: args}

                @parent.call(opts)
            end

            def call(method)
                @parent.call(methodd)
            end
        end
    end
end
