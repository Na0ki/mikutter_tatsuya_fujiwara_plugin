# -*- coding: utf-8 -*-

Plugin.create(:mikutter_tatsuya_fujiwara_plugin) do
  command(:tatsuya_fujiwara,
          name: '藤原竜也',
          condition: lambda { |opt| true },
          visible: true,
          role: :postbox
  ) do |opt|
    begin
      message = Plugin[:gtk].widgetof(opt.widget).widget_post.buffer.text
      str = ""
      message.chars { |ch| str += (ch + "゛") }

      if UserConfig[:tatuya_immediate]
        Post.primary_service.update(:message => str)
        Plugin[:gtk].widgetof(opt.widget).widget_post.buffer.text = ""
      else
        Plugin[:gtk].widgetof(opt.widget).widget_post.buffer.text = str
      end
    end
  end

  settings "藤原竜也" do
    boolean('すぐに投稿する', :steve_jobs_immediate)
  end
end
