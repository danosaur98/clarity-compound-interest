import { Client, Provider, ProviderRegistry, Result } from "@blockstack/clarity";
import { assert } from "chai";
describe("counter contract test suite", () => {
  let compoundInterestClient: Client;
  let provider: Provider;
  before(async () => {
    provider = await ProviderRegistry.createProvider();
    compoundInterestClient = new Client("SP3GWX3NE58KXHESRYE4DYQ1S31PQJTCRXB3PE9SB.compound-interest", "compound-interest", provider);
  });
  it("should have a valid syntax", async () => {
    await compoundInterestClient.checkContract();
  });

  const getVariable = async(variable: string) => {
    const query = compoundInterestClient.createQuery({
      method: { name: `get-${variable}`, args: [] },
    });
    const receipt = await compoundInterestClient.submitQuery(query);
    let result = Result.unwrapUInt(receipt);
    return result;
  }

  const updateVariable = async(variable: string, updatedValue: string) => {
      const tx = compoundInterestClient.createTransaction({
        method: {
          name: `update-${variable}`,
          args: [updatedValue],
        },
      });
      await tx.sign("SP3GWX3NE58KXHESRYE4DYQ1S31PQJTCRXB3PE9SB");
      const receipt = await compoundInterestClient.submitTransaction(tx);
    return receipt
  }

  const getTotalAccrued = async() => {
    const query = compoundInterestClient.createQuery({
      method: { name: `get-accrued-amount`, args: [] },
    });
    const receipt = await compoundInterestClient.submitQuery(query);
    let result = Result.unwrapUInt(receipt);
    return result;
  }

  describe("deploying an instance of the contract", () => {
    before(async () => {
      await compoundInterestClient.deployContract();
    });
    it("get total accrued", async () => {
      const totalAccrued = await getTotalAccrued();
      assert.equal(totalAccrued, 1000);
    })
  });
  after(async () => {
    await provider.close();
  });
});
