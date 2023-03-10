defmodule Helpdesk.Support.Ticket do
  # This turns this module into a resource
  use Ash.Resource,
    data_layer: Ash.DataLayer.Ets

  actions do
    # Add a set of simple actions. You'll customize these later.
    defaults [:create, :read, :update, :destroy]

    create :open do
      accept [:subject]
    end

    update :close do
      accept []

      change set_attribute(:status, :closed)
    end

    update :assign do
      accept []

      argument :representative_id, :uuid do
        allow_nil? false
      end

      change manage_relationship(:representative_id, :representative, type: :append_and_remove)
    end
  end

  # Attributes are the simple pieces of data that exist on your resource
  attributes do
    # Add an autogenerated UUID primary key called `:id`.
    uuid_primary_key :id

    # Add a string type attribute called `:subject`
    attribute :subject, :string do
      allow_nil? false
    end

    attribute :status, :atom do
      constraints one_of: [:open, :closed]

      default :open
      allow_nil? false
    end
  end

  code_interface do
    define_for Helpdesk.Support
    define :open, args: [:subject]
  end

  relationships do
    belongs_to :representative, Helpdesk.Support.Representative
  end
end
