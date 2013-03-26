An [ActiveSupport::Concern](http://api.rubyonrails.org/classes/ActiveSupport/Concern.html) that
allows to log the changes made in an update. By default, it will log the changes to the console
using the `Rails.logger`, but it is also possible to use custom functionality.

## Using the default

```ruby
require 'diff_logger'

class Post < ActiveRecord::Base
  include DiffLogger

  ...

end
```

This will now log (at `:info` level) the changes made during an update to the Rails console.


## Using a custom logger

```ruby
require 'diff_logger'

class Post < ActiveRecord::Base
  include DiffLogger.custom { |changes| puts "Custom: #{changes.inspect}" }

  ...

end
```

The block to `DiffLogger::custom` takes the `changes` as its argument, which is a
Hash containing the changed properties - cf. 
[the docs](http://api.rubyonrails.org/classes/ActiveModel/Dirty.html#method-i-changes)
for more information.

## License

Copyright (c) 2012-2013 Martin Boßlet. Distributed under the MIT License. See LICENSE for 
further details.

