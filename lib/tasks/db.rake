desc 'Recreate the whole database'
task fresh: [:environment, 'db:drop', 'db:create', 'db:migrate', 'db:seed']
