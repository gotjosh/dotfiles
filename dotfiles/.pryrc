local_pryrc = File.expand_path '~/.pryrc.local'
load local_pryrc if File.exists? local_pryrc

begin
  require 'awesome_print'
rescue LoadError => err
  puts "no awesome_print :("
end

begin
  if defined?(PryDebugger)
    Pry.commands.alias_command CONTINUE_SHORTCUT , 'continue'
    Pry.commands.alias_command STEP_SHORTCUT     , 'step'
    Pry.commands.alias_command NEXT_SHORTCUT     , 'next'
    Pry.commands.alias_command FINISH_SHORTCUT   , 'finish'
    Pry.commands.alias_command WHEREAMI_SHORTCUT , 'whereami'
  end
rescue LoadError => err
  puts err
end
