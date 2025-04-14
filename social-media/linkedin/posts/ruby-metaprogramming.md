🧙‍♂️ Metaprogramming em Ruby: A Magia Revelada!

✨ Ruby permite escrever código que escreve código:

1️⃣ Method Missing
```ruby
class Dynamic
  def method_missing(name, *args)
    puts "Chamou #{name} com #{args}"
  end
end

obj = Dynamic.new
obj.qualquer_metodo(42) # Funciona!
```

2️⃣ Define Method
```ruby
class Greeter
  %w[hello hi hey].each do |word|
    define_method("#{word}_world") do
      "#{word.capitalize}, World!"
    end
  end
end
```

3️⃣ Class Eval
```ruby
class Person
  # Gera getters/setters dinamicamente
  %w[name age email].each do |attr|
    class_eval "def #{attr}=(val); @#{attr}=val; end"
    class_eval "def #{attr}; @#{attr}; end"
  end
end
```

🎓 Aprenda mais sobre meta em:
https://punkdomus.dev/ruby/meta

#RubyMagic #Metaprogramming #Ruby #PunkDomus