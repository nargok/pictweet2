module ApplicationHelper

  #改行のためのメソッド
  def br(str)
    h(str).gsub(/(\r\n?)|(\n)/, "<br />").html_safe
  end
end
