module RSpec
  module Core
    module ModuleExtensions
      unless respond_to?(:module_exec)
        def module_exec(*args, &prc)
          instance_exec(*args, &prc)
        end
        alias_method :class_exec, :module_exec
      end
    end
  end
end

class Module
  include RSpec::Core::ModuleExtensions
end
