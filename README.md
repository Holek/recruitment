# Incoming webhooks

## Quick start

```
bundle install
rspec
```

## Premise

You have some incoming webhooks, which need to be stored. What do you do?

Each task guides you through different problems or requirements you might encounter in that

### About the tasks

Each task is a separate RSpec file. For convenience reasons we decided to have order-dependent tests and share state between them.

That way, when you run `rspec`, it will automatically progress with the completion of each task. So when you complete `spec/task1_spec.rb`, it will proceed to `spec/task2_spec.rb`. E.g. at first it will just show:

```
$ rspec
F

Failures:

  1) Data saving saves incoming webhooks
     Failure/Error: expect(last_json).to eq('saved' => 5)

       expected: {"saved"=>5}
            got: {"saved"=>0}

       (compared using ==)

       Diff:
       @@ -1,2 +1,2 @@
       -"saved" => 5,
       +"saved" => 0,

     # ./spec/task1_spec.rb:49:in `block (2 levels) in <top (required)>'

Finished in 0.07318 seconds (files took 0.50879 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/task1_spec.rb:45 # Data saving saves incoming webhooks
```

For the same reason we chose Sequel and SQLite as ORM and a database, respectievely. If you feel more comfortable with any other ORM or database, go for it and change it. Technology used is not as important as the concepts you'll use in solving these problems.