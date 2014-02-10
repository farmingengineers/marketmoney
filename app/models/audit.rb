class Audit < ActiveRecord::Base
  def self.audit!(admin, data)
    new.tap do |audit_record|
      audit_record.admin = admin
      audit_record.data = data
      audit_record.save!
    end
  end

  belongs_to :admin

  def data=(data)
    self.json_data = MultiJson.dump(data)
    @data = nil
  end

  def data
    if @data.nil?
      @data = (json_data.presence && decode_json_data.freeze) || false
    end
    @data || nil
  end

  private

  def decode_json_data
    return nil if json_data.blank?
    MultiJson.load(json_data)
  rescue
    {:raw => json_data}
  end
end
