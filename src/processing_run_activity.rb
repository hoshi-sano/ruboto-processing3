require 'ruboto/widget'
require 'ruboto/util/toast'

ruboto_import_widgets :Button, :LinearLayout, :TextView

java_import 'android.app.Activity'
java_import 'android.os.Bundle'
java_import 'android.view.Window'
java_import 'android.view.WindowManager'
java_import 'android.widget.FrameLayout'
java_import 'android.view.ViewGroup'
java_import 'android.app.FragmentTransaction'
java_import 'processing.core.PApplet'

require 'sketch'

class ProcessingRunActivity
  import org.ruboto.Log

  MAIN_FRAGMENT_TAG = "main_fragment";
  VIEW_ID = 0x1000;

  def onCreate(bundle)
    super(bundle)
    window = getWindow
    requestWindowFeature(Window::FEATURE_NO_TITLE)
    window.setFlags(WindowManager::LayoutParams::FLAG_LAYOUT_IN_SCREEN,
                    WindowManager::LayoutParams::FLAG_LAYOUT_IN_SCREEN);
    window.setFlags(WindowManager::LayoutParams::FLAG_FULLSCREEN,
                    WindowManager::LayoutParams::FLAG_FULLSCREEN);
    frame = FrameLayout.new(self)
    frame.setId(VIEW_ID);
    layout_params = ViewGroup::LayoutParams.new(ViewGroup::LayoutParams::MATCH_PARENT,
                                                ViewGroup::LayoutParams::MATCH_PARENT)
    setContentView(frame, layout_params)

    if bundle.nil?
      @fragment = Sketch.new
      fragment_transaction = getFragmentManager.beginTransaction
      fragment_transaction.add(frame.getId, @fragment, MAIN_FRAGMENT_TAG).commit
    else
      @fragment = getFragmentManager.findFragmentByTag(MAIN_FRAGMENT_TAG);
    end
  rescue => e
    Log.e "Exception creating activity: #{e}"
    Log.e e.backtrace.join("\n")
  end

  def onBackPressed
    @fragment.onBackPressed
    super
  end
end
