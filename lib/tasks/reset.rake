task :reset => [
  "db:drop:all",
  "db:create:all",
  "environment",
  "db:migrate",
  "db:test:prepare",
  "db:seed"
]