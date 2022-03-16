// connect to Moralis server
const serverUrl = "https://kjfkhnisfbja.usemoralis.com:2053/server"
const appId = "7R1AtAtDI0yqorQVwB9Fjs6Dko0QJkp1Ye6vzJlJ"
//Moralis.start({ serverUrl, appId });

const init = async () => {
    await Moralis.start({
        serverUrl,
        appId,
    })
    Moralis.initPlugins();
//    console.log(Moralis.Plugins);
//    console.log('Plugins initialized YEAAAH');
    const covalent = Moralis.Plugins.covalent
    
//    const result = await covalent.getChains(); this call DOESN´T requiere A PARAMETER :)
//    console.log(result.data)

    const result = await covalent.getTokenBalancesForAddress({
        chainId: 1,
        address: '0x5bAF69e0C9b4b54258A68c0f1ABF896b240F62F0',
 //       tokenAddress: '0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2',
 //       quoteCurrency?: 'EUR',
 //       pageNumber?: number;      we dont need it
 //       pageSize?: number;        we dont need it
      });
      console.log(result.data)

};

init();