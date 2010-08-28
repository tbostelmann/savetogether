class BaseController < ApplicationController
  def site_index
    @successful_savers = Saver.find_random_successful_savers(:all)
    @featured_savers  = Saver.find_random_featured(:all, :limit => 3)
    @partner_list     = random_partner_list
    @featured_donors   = Donor.find_featured_donor(3)
    @donated_amount = Donor.total_donation_amount
    @number_of_savers = Saver.number_of_savers
    @number_of_donors = Donor.number_of_donors

    # DPIRONE: note this does a lot of extra work to get CE meta data that we presently don't use,
    # so commenting out to save CPU cycles ...
    # respond_to do |format|
      # format.html { get_additional_homepage_data }
    # end
  end

protected

  def random_partner_list
    founders = random_truth?
    [OpenStruct.new(
      :partners_kind => "Founding Partners",
      :partners      => ORGANIZATION_FIND_BY_FOUNDING_PARTNERS
    ),
     OpenStruct.new(
      :partners_kind => "Supporters",
      :partners      => ORGANIZATION_FIND_BY_SUPPORTERS
    )]
  end
  
  def random_truth?
    # rand(2) returns a psuedorandom integer >= 0 and less than max=2 (in this case), i.e 0 or 1
    # See Kernel.rand, Pickaxe book, pg. 527.
    rand(2) == 1
  end

end
