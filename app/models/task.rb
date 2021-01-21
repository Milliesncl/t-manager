class Task < ApplicationRecord
  belongs_to :list

  after_create_commit { broadcast_prepend_to "tasks" }
  after_update_commit { broadcast_replace_to "tasks" }

end
