require_relative 'storage'
require_relative 'view'
require_relative 'controller'
require_relative 'router'

csv_file = File.join(__dir__, 'posts.csv')
storage = Storage.new(csv_file)
view = View.new
controller = Controller.new(storage, view)

router = Router.new(controller)

# Start the app
router.run
