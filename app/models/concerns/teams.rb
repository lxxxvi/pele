require 'active_support/concern'

module Teams
  extend ActiveSupport::Concern

  TRIGRAMS = %w[
    N/A
    ITA SUI TUR WAL
    BEL DEN FIN RUS
    AUT NED UKR
    ENG CRO CZE
    POL ESP SWE
    FRA GER POR
  ].freeze
end
