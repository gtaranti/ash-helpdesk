import Config

# if you already have a config file, then you'll just need to add this:
config :ash, :use_all_identities_in_manage_relationship?, false

config :helpdesk, :ash_apis, [Helpdesk.Support]

config :spark, :formatter,
  [
    "Ash.Resource": [
      section_order: [
        :resource,
        :identities,
        :attributes,
        :relationships,
        ...
      ]
    ],
    # If you use a different module than Ash.Resource
    "MyApp.Resource": [
      type: Ash.Resource,
      # What extensions might be added by your base module
      extensions: [...],
      section_order: [
        :resource,
        :identities,
        :attributes,
        :relationships,
        ...
      ]
    ]
  ]
