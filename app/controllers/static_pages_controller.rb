class StaticPagesController < ApplicationController
  def index
    @words = Word.select('*').from('(' +
               Word.last_measurement
                 .where([ 'measurement_id = ?', Measurement.find_by_mtype_and_name('word', 'Google') ]).to_sql + ') words')
               .order('value DESC')
               .limit(7)
    @sites = Site.select('*').from('(' +
               Site.last_measurement
                 .where([ 'measurement_id = ?', Measurement.find_by_mtype_and_name('site', 'Google') ]).to_sql + ') sites')
               .order('value DESC')
               .limit(7)
  end
end
