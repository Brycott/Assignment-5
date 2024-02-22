# README

If this is the first time you are using this project, run the following commands:

```
bundle install
rails db:migrate
```

And if you get the `Sprockets::Rails::Helper::AssetNotPrecompiledError` error, stop the server (Ctrl + C) and run the following command before launching the server again.

```
rails assets:precompile
```

To launch the server, run the command:

```
rails s
```
