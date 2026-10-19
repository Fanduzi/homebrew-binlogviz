cask "binlogviz" do
  version "0.27.0"

  on_macos do
    on_intel do
      sha256 "ed2bd6299f4be1ca6198f2e38ed300008ce1b8c437c8b943f245fa29a99d52e7"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.27.0/binlogviz_0.27.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "4f1c00f078e9aeef1b57debde39c060e59118128003acc3f1be0e369d0e613eb"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.27.0/binlogviz_0.27.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "992171881dad0f1ebccef85838f328afe5736cc841a199a645a93dbecb3adcde"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.27.0/binlogviz_0.27.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "1b731964652cc44b1e2fcc0aa450be6354763aa0722aa47427c1affe7273f61c"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.27.0/binlogviz_0.27.0_linux_arm64.tar.gz",
            verified: "github.com/Fanduzi/BinlogVisualizer/"
      end
    end
  end

  name "BinlogViz"
  desc "Local CLI for MySQL ROW binlog analysis"
  homepage "https://github.com/Fanduzi/BinlogVisualizer"

  binary "binlogviz"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", staged_path/"binlogviz"]
    end
  end
end
