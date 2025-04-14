🧵 [1/5] Design Patterns em Ruby: Thread sobre padrões essenciais!

[2/5] 🏭 Factory Pattern
```ruby
class PetFactory
  def self.create(type)
    case type
    when :dog then Dog.new
    when :cat then Cat.new
    end
  end
end
```

[3/5] 👥 Singleton
```ruby
require 'singleton'
class Logger
  include Singleton
  def log(msg)
    puts "[LOG] #{msg}"
  end
end
```

[4/5] 🔍 Observer
```ruby
require 'observer'
class Newsletter
  include Observable
  def update_sent
    changed
    notify_observers("Nova edição!")
  end
end
```

[5/5] 📚 Mais patterns em:
https://punkdomus.dev/ruby/patterns
#RubyPatterns #DesignPatterns