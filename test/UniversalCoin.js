const UniversalCoin = artifacts.require('./UniversalCoin.sol')
const UCDistributor = artifacts.require('./UCDistributor.sol')

contract('UniversalCoin', (accounts) => {

  let universalCoinContract
  let distributionContract
  const startTime = new Date('Wed July 14 2018 00:00:00 GMT+1100').getTime()
  const owner = accounts[0]

  beforeEach('setup contract for each test', async () => {
    universalCoinContract = await UniversalCoin.new(
      startTime,
    )
    distributionContract = await UCDistributor.new();
  })

  it('has an owner', async () => {
    console.log('onwer', owner);
    assert.equal(await universalCoinContract.owner(), owner)
  })

  it('approve 10M coins and transfer to set addresses', async () => {
    console.log('onwer', owner);
    await universalCoinContract.transfer(distributionContract.address, 40000000)

    await distributionContract.transfer(accounts[2], 50000)
    const balanceOfBuyer = await universalCoinContract.balanceOf(accounts[2])

    assert.equal(balanceOfBuyer, 50000, 'should be 10')
  })

});
